//
//  ViewController.swift
//  RxSiwft
//
//  Created by Jason on 2016. 6. 14..
//  Copyright © 2016년 genoplan. All rights reserved.
//

import UIKit
import Foundation
import RxSiwft
import RxCocoa



class ViewController: UIViewController {

    @IBAction func hotColdAction(sender: AnyObject) {
//        let scheduler = 
    }
    
    var circleView : UIView!
    
    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setup() {
        circleView = UIView(frame: CGRect(origin: view.center, size: CGSize(width: 100, height: 100)))
        circleView.layer.cornerRadius = circleView.frame.width/2
        circleView.center = view.center
        circleView.backgroundColor = UIColor.greenColor()
        view.addSubview(circleView)
        
        
        let gestureRecognizer = UIPanGestureRecognizer(target: self, action: "circleMoved:")
        circleView.addGestureRecognizer(gestureRecognizer)
    }
    func circleMoved(recognizer : UIPanGestureRecognizer) {
        let location = recognizer.locationInView(view)
        UIView.animateWithDuration(0.1){
            self.circleView.center = location
        }
    }
    
}

