import Foundation
import UIKit

public class SegmentDataSource: NSObject, UICollectionViewDataSource {
    
    var contents:[String]
    init(_ contents:[String]) {
        self.contents = contents
        super.init()
    }
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.contents.count
    }
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Segment.cellClassName, for: indexPath) as! SegmentCollectionViewCell
        let content = self.contents[indexPath.row]
        cell.prepareCellWith(content)
        cell.disable()
        return cell
    }
    
}
