//
//  ViewController.swift
//  Task_19_GesturesRecognizers
//
//  Created by MacBook Pro on 04.11.21.
//

import UIKit
import ScreenTime

class MainViewController: UIViewController {
    
    @IBOutlet weak var bananaTopArchor: NSLayoutConstraint!
    @IBOutlet weak private var banana: UIButton! {
        didSet {
            banana.isUserInteractionEnabled = true
        }
    }
    @IBOutlet weak private var monkey: UIImageView!{
        didSet {
            monkey.isUserInteractionEnabled = true
        }
    }
    
    var lastLocation = CGPoint(x: 0, y: 0)
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPanGestureForMonkey()
    
        
    }
    @IBAction func onBananaClick(_ sender: UIButton) {
        UIView.animate(withDuration: 3, animations: {
            self.banana.transform = CGAffineTransform(translationX: 0, y: UIScreen.main.bounds.height - self.monkey.frame.height-100)
        }, completion: {(finished:Bool) in
            bananaReturnIfMiss()
        })
        
        
        func bananaReturnIfMiss(){
            let equalitiX = self.banana.frame.midX - self.monkey.frame.midX // - self.monkey.frame.origin.x
           // let equalitiy = self.banana.frame.origin.y - self.monkey.frame.origin.y
            print(self.monkey.frame.midX)
            print(equalitiX)
            if equalitiX * equalitiX < 5000 {
                print("done")
                self.banana.isHidden = true
                self.monkey.image = UIImage(named:"monkeyWithBanana")
            }
            else {
                self.banana.transform = CGAffineTransform(translationX: 0, y: 0)
            }
        }
        
    }
    
    private func setupPanGestureForMonkey() {
        let panGesture = UIPanGestureRecognizer(
            target: self,
            action: #selector(handlePanGesture(_:))
        )
        
        monkey.addGestureRecognizer(panGesture)
    }
}


private extension MainViewController {
    @objc private func handleTapGesture(_ gesture: UITapGestureRecognizer) {
        print(#function)
    }
    
    
    @objc private func handlePanGesture(_ gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: view)
        // let velocity = gesture.velocity(in: view)
        let width = UIScreen.main.bounds.width
        // print(translation)
        //print(width)
        print(lastLocation)
        if (0 <= monkey.frame.origin.x  ){
            
            monkey.transform = CGAffineTransform(translationX:   translation.x, y: 0)
            
            
        }else {
            monkey.transform = CGAffineTransform(translationX: width-1, y: 0)
        }
    }
    
    
}
extension Thread {
    var threadName: String {
        if isMainThread {
            return "main"
        } else if let threadName = Thread.current.name, !threadName.isEmpty {
            return threadName
        } else {
            return description
        }
    }
    
    var queueName: String {
        if let queueName = String(validatingUTF8: __dispatch_queue_get_label(nil)) {
            return queueName
        } else if let operationQueueName = OperationQueue.current?.name, !operationQueueName.isEmpty {
            return operationQueueName
        } else if let dispatchQueueName = OperationQueue.current?.underlyingQueue?.label, !dispatchQueueName.isEmpty {
            return dispatchQueueName
        } else {
            return "n/a"
        }
    }
}
