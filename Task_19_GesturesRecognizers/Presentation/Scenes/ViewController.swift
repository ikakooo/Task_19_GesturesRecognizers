//
//  ViewController.swift
//  Task_19_GesturesRecognizers
//
//  Created by MacBook Pro on 04.11.21.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var bananaTopArchor: NSLayoutConstraint!
    @IBOutlet weak private var banana: UIImageView! {
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
        
       
    }

    private func setupPanGestureForBanana() {
        let fallDown = UISwipeGestureRecognizer(
            target: self,
            action: #selector(handlefallDown(_:))
        )
        
        banana.addGestureRecognizer(fallDown)
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
    
    @objc private func handlefallDown(_ gesture: UISwipeGestureRecognizer) {
//        UIView.animateWithDuration(10, delay: 0, options: [UIViewAnimationOptions.CurveEaseIn], animations: {
//            banana.center = CGPoint(x: banana.center.x, y: 300)
//        }, completion: nil)
    }}
