import Foundation
import UIKit

class SegmentDelegate:NSObject, UICollectionViewDelegateFlowLayout{
    
    private var cellWidths = [CGFloat]()
    
    init(_ cv:UICollectionView) {
        super.init()
        precalculateWidths(cv)
    }
    
    private func precalculateWidths(_ collectionView:UICollectionView){
        var widths = [CGFloat]()
        for name in Segment.tabNames {
            let textSize = (name as NSString).size(attributes: [NSFontAttributeName: Segment.Font.selected])
            let width = textSize.width + 40 // arbitrary value for padding, 40px = [20px LABEL 20px]
            widths.append(width)
        }
        
        if Segment.mode == .equalSize {
            let maxSize = widths.sorted(by: { $0 > $1 }).first!
            for _ in Segment.tabNames {
                cellWidths.append(maxSize)
            }
        }
        else if Segment.mode == .wrapText {
            cellWidths.append(contentsOf: widths)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath) as! SegmentCollectionViewCell
        guard cell.tabSelected == false else { return }
        
        let cells = collectionView.visibleCells as! [SegmentCollectionViewCell]
        for c in cells {
            if c != cell {
                c.disable()
            }
        }
        cell.enable()
        collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
        
        NotificationCenter.default.post(name: .SegmentOptionSelectedNotification, object: indexPath.row)
    }
    
    //
    // Provide additional level of control on the layout, ie where cell size may differ while keeping padding stable
    //
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: cellWidths[indexPath.row], height: Segment.Size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if Segment.position == .center {
            let totalWidth:CGFloat = cellWidths.reduce(0, { $0 + $1})
            let leftInset = CGFloat((collectionView.bounds.width - totalWidth) / 2)
            if leftInset > 0 {
                let rightInset = leftInset
                return UIEdgeInsetsMake(0, leftInset, 0, rightInset)
            }
        }
        return .zero
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
