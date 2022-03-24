//
//  AuthService.swift
//  VkNewsFeed
//
//  Created by Nikita Kryuchkov on 13.03.2022.
//

import Foundation
import VK_ios_sdk

protocol AuthServiceDelegate: AnyObject {
    func authServiceShouldShow(_ viewController: UIViewController)
    func authServiceSignIn()
    func authServiceSignInDidFail()
}

class AuthService: NSObject, VKSdkDelegate, VKSdkUIDelegate {
    
    weak var delegate: AuthServiceDelegate?
    
    var token: String? {
        return VKSdk.accessToken()?.accessToken
    }
    
    private let appId = "8100184"
    private let vkSdk: VKSdk
    
    override init() {
        vkSdk = VKSdk.initialize(withAppId: appId)
        super.init()
        print("VKSdk.initialize")
        vkSdk.register(self)
        vkSdk.uiDelegate = self
    }
    
    func wakeUpSession() {
//        let scope = ["offline", "photos", "wall", "friends"]
        let scope = ["wall", "friends"]
        
        VKSdk.wakeUpSession(scope) { [delegate] (state, error) in
            switch state {
            case .initialized:
                print("initialized")
                VKSdk.authorize(scope)
            case .authorized:
                print("authorized")
                delegate?.authServiceSignIn()
            default:
                print("auth problems, state \(state) error \(String(describing: error))")
                delegate?.authServiceSignInDidFail()
            }
        }
    }
    
    // MARK: VKSdkDelegate
    
    func vkSdkAccessAuthorizationFinished(with result: VKAuthorizationResult!) {
        print(#function)
        if result.token != nil {
            delegate?.authServiceSignIn()
        }
    }
    
    func vkSdkUserAuthorizationFailed() {
        print(#function)
        delegate?.authServiceSignInDidFail()
    }
    
    // MARK: VkSdkUIDelegate
    
    func vkSdkShouldPresent(_ controller: UIViewController!) {
        print(#function)
        delegate?.authServiceShouldShow(controller)
    }
    
    func vkSdkNeedCaptchaEnter(_ captchaError: VKError!) {
        print(#function)
    }
}
