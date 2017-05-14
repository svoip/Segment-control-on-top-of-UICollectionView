import Foundation
import UIKit

public class SegmentCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var title: UILabel!
    
    public var tabSelected:Bool = false
    
    public func prepareCellWith(_ text: String) {
        self.title.text = text.uppercased()
    }

    override public func awakeFromNib() {
        super.awakeFromNib()
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.borderWidth = 1
    }

    public func enable(){
        self.backgroundColor = .green
        self.title.textColor = .black
        self.title.font = Segment.Font.selected        
        tabSelected = true
    }
    public func disable(){
        self.backgroundColor = .white
        self.title.textColor = .lightGray
        self.title.font = Segment.Font.unselected
        tabSelected = false
    }
    
}
