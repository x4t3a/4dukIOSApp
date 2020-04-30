//
//  AppDelegate.swift
//  4duk
//
//  Created by Andrey Dunaev on 07.03.2020.
//  Copyright © 2020 Andrey Dunaev. All rights reserved.
//

import UIKit
import AVFoundation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(
        _                             application:   UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            debugPrint(error)
        }
        return true
    }

    func application(
        _                          application:            UIApplication,
        configurationForConnecting connectingSceneSession: UISceneSession,
                                   options:                UIScene.ConnectionOptions
    ) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration",
                                    sessionRole: connectingSceneSession.role)
    }

    func application(
        _                       application:   UIApplication,
        didDiscardSceneSessions sceneSessions: Set<UISceneSession>
    ) {
    }
} // AppDelegate

