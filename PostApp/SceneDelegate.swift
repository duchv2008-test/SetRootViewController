//
//  SceneDelegate.swift
//  PostApp
//
//  Created by duchv on 2023/05/11.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
        let isLoggedIn = UserDefaults.standard.bool(forKey: "LoggedIn")
        if isLoggedIn {
            routeToMain()
        } else {
            routeToAuthNavigation()
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }
}

extension SceneDelegate {
    private func routeToAuthNavigation() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let homePageVC = storyboard.instantiateViewController(withIdentifier: "LoginViewController")
        window?.rootViewController = homePageVC
        window?.makeKeyAndVisible()
    }

    private func routeToMain() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let authNavigation = storyboard.instantiateViewController(withIdentifier: "MainViewController")

        window?.rootViewController = authNavigation
        window?.makeKeyAndVisible()
    }
}
