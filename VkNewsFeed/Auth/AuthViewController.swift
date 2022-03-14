//
//  ViewController.swift
//  VkNewsFeed
//
//  Created by Nikita Kryuchkov on 12.03.2022.
//

import UIKit

class AuthViewController: UIViewController {

    @IBAction func signInTouch(_ sender: Any) {
        authSrvice.wakeUpSession()
    }
    
    private var authSrvice: AuthService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        authSrvice = SceneDelegate.shared().authService
        view.backgroundColor = .red
    }

    

}

