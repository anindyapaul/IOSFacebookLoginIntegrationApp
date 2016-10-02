//
//  ViewController.swift
//  iosLoginIntegrationApp
//
//  Created by Anindya Paul on 10/1/16.
//  Copyright © 2016 Anindya Paul. All rights reserved.
//

import UIKit


class ViewController: UIViewController, FBSDKLoginButtonDelegate {
    
    let loginButton: FBSDKLoginButton = {
        let button = FBSDKLoginButton()
        button.readPermissions = ["email"]
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(loginButton)
        loginButton.center = view.center
        loginButton.delegate = self
        
        if let token = FBSDKAccessToken.current() {
            fetchProfile()
        }
    }
    
    func fetchProfile() {
            
        let parameters = ["fields":"email,first_name,last_name,picture.type(large)"] //set request permission
        FBSDKGraphRequest(graphPath: "me", parameters: parameters).start(completionHandler: { (connection, result, error) -> Void in
            
                if error != nil {
                    print(error)
                    return
                }
                if let email = result as? [String:[AnyObject]]{
                    print(email) //print current login user's email in the console
                }
            
                if let firtsName = result as? [String:[AnyObject]]{
                    print(firtsName) //print current login user's email in the console
                }
            
                if let lastName = result as? [String:[AnyObject]]{
                    print(lastName) //print current login user's email in the console
                }
            
            })
            
        }

    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        
        fetchProfile()
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        let loginManager: FBSDKLoginManager = FBSDKLoginManager()
        loginManager.logOut()
    }
    
    func loginButtonWillLogin(_ loginButton: FBSDKLoginButton!) -> Bool {
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

