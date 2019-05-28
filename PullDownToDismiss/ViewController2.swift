//
//  ViewController2.swift
//  PullDownToDismiss
//
//  Created by Thein Htike Aung on 28/5/19.
//  Copyright © 2019 Thein Htike Aung. All rights reserved.
//

import UIKit

class ViewController2: UIViewController, UIGestureRecognizerDelegate {

    var panGestureRecognizer : UIPanGestureRecognizer!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(self.panRecognized))
        panGestureRecognizer.delegate = self
        scrollView.addGestureRecognizer(panGestureRecognizer)
    }
    
    
    @objc func panRecognized(recognizer: UIPanGestureRecognizer) {
        if recognizer.state == .began && scrollView.contentOffset.y == 0 {
            
        } else if recognizer.state != .ended && recognizer.state != .cancelled && recognizer.state != .failed {
            let panOffset = recognizer.translation(in: scrollView)
            let eligiblePanOffset = panOffset.y > 300
            if eligiblePanOffset {
                recognizer.isEnabled = false
                recognizer.isEnabled = true
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
