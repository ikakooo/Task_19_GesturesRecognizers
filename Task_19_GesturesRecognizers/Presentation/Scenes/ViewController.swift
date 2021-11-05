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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       // setupSwipeGesture()
        setupPanGestureForMonkey()
       // setupPanGestureForBanana()
       
    }
    @IBAction func onBananaClick(_ sender: UIButton) {
        let dsfsd = banana.frame.origin.x
       // for i in Int(banana.frame.origin.x)...Int(UIScreen.main.bounds.height){
           // sleep(1)
            //DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(40), execute: {
               // print("done")
               /// self.bananaTopArchor.constant = CGFloat(i) - self.banana.frame.origin.x
                UIView.animate(withDuration: 2) {
                    self.banana.transform = CGAffineTransform(translationX: 0, y: UIScreen.main.bounds.height - self.monkey.frame.origin.x)
                    
                }
//        UIView.animate(withDuration: 2) {
//            self.banana.transform = CGAffineTransform(rotationAngle: .pi)
//        }
           // })
//            do {
//                sleep(1)
//            }
            //Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(callbackk), userInfo: nil, repeats: false)
       // }
//        let equalitiX = banana.frame.origin.x - monkey.frame.origin.x
//        if equalitiX

    }
    
    
    @objc private func callbackk() {
        print("done")
    }

   
    
//    private func setupPanGestureForBanana() {
//        let fallDown = UISwipeGestureRecognizer(
//            target: self,
//            action: #selector(handleDirectedPanGesture(_:))
//        )
//
//        banana.addGestureRecognizer(fallDown)
//    }
    
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
        let velocity = gesture.velocity(in: view)
        let width = UIScreen.main.bounds.width
       // print(translation)
        print(width)
        print(monkey.frame.origin.x)
        if (0 <= monkey.frame.origin.x  ){
            
            monkey.transform = CGAffineTransform(translationX: translation.x, y: 0)
            
        }else {
            monkey.transform = CGAffineTransform(translationX: width-1, y: 0)
        }
        
//        if (){
//            monkey.transform = CGAffineTransform(translationX: translation.x, y: 0)
//        }
    }
    
//    @objc private func handleDirectedPanGesture(_ gesture: DirectedPanGestureRecognizer) {
//
//        guard let direction = gesture.direction else { return }
//
//        switch direction {
//        case .right:
//            banana.transform = CGAffineTransform(translationX: 80, y: 0)
//        case .left:
//            banana.transform = CGAffineTransform(translationX: -80, y: 0)
//        default:
//            break
//        }
//    }
    
    
}
