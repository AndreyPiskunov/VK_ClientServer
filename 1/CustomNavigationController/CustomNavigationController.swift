//
//  CustomNavigationController.swift
//  VK
//
//  Created by User on 28.06.2022.
//

import UIKit

class CustomNavigationController: UINavigationController, UINavigationControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        if operation == .push {
            return CustomNavigationControllerAnimate()
        } else if operation == .pop {
            return CustomNavigationControllerPop()
    }
    return nil }
    }


class CustomNavigationControllerAnimate: NSObject,  UIViewControllerAnimatedTransitioning {
    
//    Interval transition
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.6
    }
//    Source and destination controller
        
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let source = transitionContext.viewController(forKey: .from) else
        { return }
        guard let destination = transitionContext.viewController(forKey: .to) else
        { return }
        
//    Append next ViewController
        
        transitionContext.containerView.addSubview(destination.view)
        destination.view.frame = source.view.frame
        destination.view.transform = CGAffineTransform(translationX: source.view.frame.width, y: 0)
   
        
        UIView.animateKeyframes(withDuration: self.transitionDuration(using: transitionContext),
        delay: 0,
        options: .calculationModePaced, animations: {
        
        
        UIView.addKeyframe(withRelativeStartTime: 0,
                           relativeDuration: 0.75,
                           animations: {
                            let translation = CGAffineTransform(translationX: -200, y: 0)
                            let scale = CGAffineTransform(scaleX: 0.8, y: 0.8)
        
            source.view.transform = translation.concatenating(scale) })

        UIView.addKeyframe(withRelativeStartTime: 0,
                           relativeDuration: 0.4,
                           animations: {
                            let translation = CGAffineTransform(translationX: 2, y: 0)
            let scale = CGAffineTransform(scaleX: 1.2, y: 1.2)
    
            destination.view.transform = translation.concatenating(scale) })
        
        UIView.addKeyframe(withRelativeStartTime: 0.4,
                           relativeDuration: 0.4,
                           animations: {
            
            destination.view.transform = .identity
        })
        }) { finished in
        if finished && !transitionContext.transitionWasCancelled {
        source.view.transform = .identity }
        transitionContext.completeTransition(finished && !transitionContext.transitionWasCancelled)
        }
    }

}


class CustomNavigationControllerPop: NSObject,  UIViewControllerAnimatedTransitioning {
    
//    Interval transition
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.6
    }
    
//    Source and destination controller
        
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let source = transitionContext.viewController(forKey: .from) else
        { return }
        guard let destination = transitionContext.viewController(forKey: .to) else
        { return }
    
//    Append next ViewController
        
        transitionContext.containerView.addSubview(destination.view)
        destination.view.sendSubviewToBack(destination.view)
        destination.view.frame = source.view.frame
//    Append animations
        
        UIView.animateKeyframes(withDuration: self.transitionDuration(using: transitionContext),
        delay: 0,
        options: .calculationModePaced, animations: {
        
        
        UIView.addKeyframe(withRelativeStartTime: 0,
                           relativeDuration: 0.75,
                           animations: {
                            let translation = CGAffineTransform(translationX: -200, y: 0)
                            let scale = CGAffineTransform(scaleX: 0.8, y: 0.8)
        
            source.view.transform = translation.concatenating(scale) })

        UIView.addKeyframe(withRelativeStartTime: 0.2,
                           relativeDuration: 0.4,
                           animations: {
                            let translation = CGAffineTransform(translationX: 2, y: 0)
            let scale = CGAffineTransform(scaleX: 1.2, y: 1.2)
    
            destination.view.transform = translation.concatenating(scale) })
        
        UIView.addKeyframe(withRelativeStartTime: 0.25,
                           relativeDuration: 0.75,
                           animations: {
            
            destination.view.transform = .identity
        })
        }) { finished in
        if finished && !transitionContext.transitionWasCancelled {
        source.view.transform = .identity }
        transitionContext.completeTransition(finished && !transitionContext.transitionWasCancelled)
        }
    }

}

