import Foundation
import UIKit
import SnapKit

public class Segment:NSObject {
    
    //
    // Configuration of the segment control
    //
    public struct Size {
        static let height:CGFloat = 50
        private init() {}
    }
    public struct Font {
        static let selected = UIFont(name: "Avenir-Black", size: 20)!
        static let unselected = UIFont(name: "Avenir-Medium", size: 18)!
        private init() {}
    }
    
    //
    // How each tab's width has to be calculated
    //
    public enum WidthDistributionMode {
        case equalSize
        case wrapText
    }
    public static let mode:WidthDistributionMode = .equalSize
    
    //
    // How the container of the tabs should position itself horizontally
    //
    public enum Position {
        case left
        case center
    }
    public static let position:Position = .center
    
    
    public static let tabNames = ["Animals", "Birds", "Plants", "Mountains", "Rivers"]
    public static let cellClass = SegmentCollectionViewCell.self
    public static let cellClassName = "SegmentCollectionViewCell"
    
    private var dataSource:UICollectionViewDataSource?
    private var delegate:UICollectionViewDelegateFlowLayout?
    
    public func addTo(_ view: UIView){
        
        // prepare the container view
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let container = UICollectionView(frame: .zero, collectionViewLayout: layout)
        container.backgroundColor = .clear
        container.showsHorizontalScrollIndicator = false
        container.elevate(elevation: 8)
        view.addSubview(container)
        
        // configure its data-source and delegate object
        dataSource = SegmentDataSource(Segment.tabNames)
        container.dataSource = dataSource
    
        delegate = SegmentDelegate(container)
        container.delegate = delegate
        
        container.register(UINib(nibName: Segment.cellClassName, bundle: nil), forCellWithReuseIdentifier: Segment.cellClassName)
        
        // layout
        container.snp.makeConstraints { (maker) in
            maker.width.equalToSuperview()
            maker.height.equalTo(Segment.Size.height)
            maker.top.equalToSuperview()
            maker.centerX.equalToSuperview()
        }
        
        // event-handling
        on(.UIDeviceOrientationDidChange) { _ in
            layout.invalidateLayout()
        }
        
    }
}

public extension NSObject {
    
    typealias NotificationBlock = (Notification)->Void
    public func on(_ event: NSNotification.Name, _ callback: @escaping NotificationBlock) {
        NotificationCenter.default.addObserver(forName: event,
                                               object: nil,
                                               queue: nil) { notif in
                                                callback(notif)
        }
    }
    
}
public extension UIView {
    
    // Material style 3D effect
    func elevate(elevation: Double) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: elevation)
        self.layer.shadowRadius = CGFloat(elevation)
        self.layer.shadowOpacity = 0.24
    }
}
extension NSNotification.Name {
    
    public static let SegmentOptionSelectedNotification = Notification.Name("SegmentOptionSelectedNotification")
}
