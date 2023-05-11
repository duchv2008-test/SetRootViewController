//
//  MainViewController.swift
//  PostApp
//
//  Created by duchv on 2023/05/11.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func handleBtnAction(_ sender: UIButton) {
        UserDefaults.standard.removeObject(forKey: "LoggedIn")
        UserDefaults.standard.synchronize()
        routeToAuthNavigation()
    }

    private func routeToAuthNavigation() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let authNavigation = storyboard.instantiateViewController(withIdentifier: "LoginViewController")

        let keyWindow = UIApplication.shared.connectedScenes
                        .filter({$0.activationState == .foregroundActive})
                        .compactMap({$0 as? UIWindowScene})
                        .first?.windows
                        .filter({$0.isKeyWindow}).first
        keyWindow?.rootViewController = authNavigation
        keyWindow?.makeKeyAndVisible()
    }
}
