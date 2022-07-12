//
//  ViewController.swift
//  1
//
//  Created by User on 21.05.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var userLoginTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    
    @IBOutlet weak var leftView: UIView!
    @IBOutlet weak var centreView: UIView!
    @IBOutlet weak var rightView: UIView!
    
    @IBOutlet weak var vkLabel: UILabel!
    
    let toTapBarController =  "toTapBarController"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Session.shared.userId = 23
        print(Session.shared.userId)
        
        Session.shared.token = "Andrey"
        print(Session.shared.token)
        
        
        leftView.alpha = 0
        centreView.alpha = 0
        rightView.alpha = 0
        
        let tap =  UITapGestureRecognizer (target: self, action: #selector(onTap))
        self.view.addGestureRecognizer(tap)
        
    }
        @objc func onTap (_ sender: Any) {
            self.view.endEditing(true)
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        loadingViewAnimation()
//    }
  
//  Анимация загрузки
    
//    func loadingViewAnimation(){
//        UIView.animate(withDuration: 0.5) { [weak self] in
//            self?.leftView.alpha = 0
//            self?.centreView.alpha = 1
////            self?.rightView.alpha = 0
//        } completion: { _ in
//            UIView.animate(withDuration: 0.5) { [weak self] in
////                self?.leftView.alpha = 0
//                self?.centreView.alpha = 0
//                self?.rightView.alpha = 1
//            } completion: { _ in
//                UIView.animate(withDuration: 0.5) { [weak self] in
//                    self?.leftView.alpha = 1
////                    self?.centreView.alpha = 0
//                    self?.rightView.alpha = 0
//                } completion: { [weak self] _ in
//                    self?.loadingViewAnimation()
//                }
//            }
//        }
//    }
    
//  Логика нажатия кнопки
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        
        
        UIView.animate(withDuration: 0.5, animations: { self.vkLabel.frame.origin.y -= 300
        })
        
        UIView.animate(withDuration: 0.7, animations: { self.userLoginTextField.frame.origin.x -= 1000
            self.loginLabel.frame.origin.x -= 1000
            self.userPasswordTextField.frame.origin.x += 1000
            self.passwordLabel.frame.origin.x += 1000
        })
        
        UIView.animate(withDuration: 3,
                    delay: 0,
                    usingSpringWithDamping: 0.45,
                    initialSpringVelocity: 3,
                    options: [],
                    animations: {
                    [weak self] in
                        guard let self = self else {return}
                        let translation = CGAffineTransform(translationX: 0, y: 150)
                        self.loginButton.transform = translation },
                    completion: { [weak self] _ in
            guard let self = self else {return}
            self.performSegue(withIdentifier: self.toTapBarController, sender: nil)
 })
        
//        Download animation 3 stripes
        
        UIView.animate(withDuration: 0.9) { [weak self] in
                self?.leftView.alpha = 0
                self?.centreView.alpha = 1
//              self?.rightView.alpha = 0
                
            } completion: { _ in
                UIView.animate(withDuration: 0.9) { [weak self] in
    //              self?.leftView.alpha = 0
                    self?.centreView.alpha = 0
                    self?.rightView.alpha = 1
                    
                } completion: { _ in
                    UIView.animate(withDuration: 0.9) { [weak self] in
                        self?.leftView.alpha = 1
       //               self?.centreView.alpha = 0
                        self?.rightView.alpha = 0
                        
                    } completion: { [weak self] _ in
                        self?.viewDidLoad()
                    }
                }
            }
        }
        
}

        
        
        
//        let animate = CABasicAnimation.init(keyPath: "position.x")
//        animate.toValue = 500
//        animate.duration = 3.0
//        animate.beginTime = CACurrentMediaTime() + 2
//        userLoginTextField.layer.add(animate, forKey: nil)
//        userPasswordTextField.layer.add(animate, forKey: nil)
//
        
//        let animate = CASpringAnimation(keyPath: "position.x")
//                animate.toValue = 550
//                animate.duration = 3.0
//                animate.mass = 3
//                animate.stiffness = 70
//                animate.damping = 20
//                animate.initialVelocity = 1
//
//                userLoginTextField.layer.add(animate, forKey: nil)
//                userPasswordTextField.layer.add(animate, forKey: nil)
//
        
    
//        guard let login = userLoginTextField.text,
//              login == "mail@mail.ru"
//        else {
//            return userLoginTextField.backgroundColor = UIColor.systemRed
//        }
//        userLoginTextField.backgroundColor = UIColor.systemGreen
//
//        guard let password = userPasswordTextField.text,
//              password == "12345"
//        else {
//            return userPasswordTextField.backgroundColor = UIColor.systemRed
//        }
//        userPasswordTextField.backgroundColor = UIColor.systemGreen
//
//        performSegue(withIdentifier: toTapBarController, sender: nil)
//    }
//}

    
//        if let login = userLoginTextField.text, login == "mail@mail.ru"{
//            userLoginTextField.backgroundColor = UIColor.systemGreen }
//        else {
//            userLoginTextField.backgroundColor = UIColor.systemRed
//        }
//
//        if let password = userPasswordTextField.text, password == "12345"{
//            userPasswordTextField.backgroundColor = UIColor.systemGreen }
//        else {
//            userPasswordTextField.backgroundColor = UIColor.systemRed
//        }
