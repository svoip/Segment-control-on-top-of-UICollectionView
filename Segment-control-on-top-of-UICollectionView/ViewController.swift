//
//  ViewController.swift
//  Segment-control-on-top-of-UICollectionView
//
//  Created by Sardorbek on 13/05/2017.
//  Copyright © 2017 Sardorbek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let segment = Segment()
    @IBOutlet weak var result: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.edgesForExtendedLayout = []
        self.title = "Choose an option"
        segment.addTo(self.view)
        
        on(.SegmentOptionSelectedNotification) { notif in
            if let index = notif.object as? Int {
                self.result.text = "You selected option \(index)"
            }
        }
    }
}

