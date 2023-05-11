//
//  LoginViewController.swift
//  PostApp
//
//  Created by duchv on 2023/05/11.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func handleBtnAction(_ sender: UIButton) {
        /**
         1. Lưu giá trị flag (cờ) có giá trị là true vào key LoggedIn sử dụng UserDefaults của iOS
         2. Thực hiện synchronize UserDefaults để đảm bảo giá trị được lưu.
         */
        UserDefaults.standard.set(true, forKey: "LoggedIn")
        UserDefaults.standard.synchronize()
        routeToMain()
    }

    private func routeToMain() {
        // 3. Thực hiện lấy ra MainViewController từ storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let homePageVC = storyboard.instantiateViewController(withIdentifier: "MainViewController")

        // 4. Thực hiện lấy ra được keyWindow của ứng dụng thông qua scenes (kể từ iOS 13 trở lên)
        let keyWindow = UIApplication.shared.connectedScenes
                        .filter({$0.activationState == .foregroundActive})
                        .compactMap({$0 as? UIWindowScene})
                        .first?.windows
                        .filter({$0.isKeyWindow}).first

        // 5. Thực hiện gán lại rootViewController cho key window
        keyWindow?.rootViewController = homePageVC
        keyWindow?.makeKeyAndVisible()
    }
}
