//
//  AppDelegate.swift
//  ContentsCardTest1
//
//  Created by Mao Ito on 2024/05/22.
//

import UIKit
import BrazeKit
import BrazeUI
import Foundation

@main
class AppDelegate: UIResponder, UIApplicationDelegate,BrazeInAppMessageUIDelegate {

    static var braze: Braze? = nil
    static var showIAM: Bool? = true

    func completion(id:  String){
        
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        // Mao Ito Test merge
        let configuration = Braze.Configuration(
          apiKey: "xxxx",
          endpoint: "xxx"
        )
        configuration.optInWhenPushAuthorized = false
        NSLog("useUUIDAsDeviceID")
        NSLog(stringFromAny(configuration.useUUIDAsDeviceId))
        configuration.useUUIDAsDeviceId = true
        NSLog("after useUUIDAsDeviceID")
        NSLog(stringFromAny(configuration.useUUIDAsDeviceId))
        // - Enable logging or customize configuration here
        configuration.logger.level = .info
        let braze = Braze(configuration: configuration)
        AppDelegate.braze = braze
        AppDelegate.braze?.changeUser(userId: "maoito_IAM_1018")
        
        NSLog("device id")
        NSLog(braze.deviceId)
        braze.set(identifierForVendor:  braze.deviceId)
        
        let appDomain = Bundle.main.bundleIdentifier
        NSLog(appDomain!)
//        UserDefaults.standard.removePersistentDomain(forName: appDomain!)
        
        AppDelegate.braze?.user.id(completion: { (id) in
            NSLog("what is the external_id?")
            NSLog(id!)
            NSLog("finish completion")
        })
        
        
//        AppDelegate.braze?.changeUser(userId: "maoito_contentcard_test1_dashboard")
       // AppDelegate.braze?.contentCards.requestRefresh()
//        NSLog("user id")
        NSLog(stringFromAny(braze.deviceId))
//        let cards: [Braze.ContentCard] = AppDelegate.braze?.contentCards.cards ?? []
//        let formatter = DateComponentsFormatter()
////        NSLog("hellow world")
//        NSLog(stringFromAny(cards[0]))
//        NSLog(stringFromAny(cards[1]))
//        NSLog(stringFromAny(cards[0].removed))
//
//        cards[0].context?.logDismissed();
//
//        NSLog("hellow world 2nd")
//        NSLog(stringFromAny(cards[0]))
//        cards[0].context?.logImpression()
//        let createdAt = formatter.string(for: cards[0].createdAt)
//        NSLog(createdAt ?? "not found createdAt")
//        NSLog(cards[0].title ?? "not found title")
//        
//        NSLog(stringFromAny(cards[1].extras))
//        NSLog(stringFromAny(cards[0].extras))
//        NSLog(stringFromAny(cards[0].description))
//        NSLog(stringFromAny(cards[0].title))
//        NSLog(stringFromAny(cards[0].description))
//        let date = NSDate(timeIntervalSince1970: cards[0].createdAt)
//        NSLog(stringFromAny(date))
//        
//        NSLog(stringFromAny(cards[0].viewed))
//        NSLog(stringFromAny(cards[0].expiresAt))
//        
//        NSLog("lastUpdate !")
//        NSLog(stringFromAny(AppDelegate.braze?.contentCards.lastUpdate))
//        
//        NSLog("finish ggg")
        
//         InAppMessage UI
//        braze.inAppMessagePresenter = BrazeInAppMessageUI()
        // - InAppMessage UI
        let inAppMessageUI = BrazeInAppMessageUI()
        inAppMessageUI.delegate = self
        braze.inAppMessagePresenter = inAppMessageUI
        
        return true
    }
    func stringFromAny(_ value:Any?) -> String {

        if let nonNil = value, !(nonNil is NSNull) {

            return String(describing: nonNil) // "Optional(12)"
        }
        return ""
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    func inAppMessage(
      _ ui: BrazeInAppMessageUI,
      displayChoiceForMessage message: Braze.InAppMessage
    ) -> BrazeInAppMessageUI.DisplayChoice{
        
        NSLog("hellow in app delegate");
        if(AppDelegate.showIAM!){
            return .now
        }
        return .discard
    }
    
    func inAppMessage(
       _ ui: BrazeInAppMessageUI, shouldProcess clickAction: Braze.InAppMessage.ClickAction,
       buttonId: String?, message: Braze.InAppMessage, view: InAppMessageView
     ) -> Bool {
         NSLog("hellow button clicked");
         NSLog(stringFromAny(clickAction))
       guard let buttonId,
         let idInt = Int(buttonId)
       else { return true }
         
         
//       switch message {
//       case .modal(let modal):
//         button = modal.buttons[idInt]
//
//       case .modalImage(let modalImage):
//         button = modalImage.buttons[idInt]
//
//       case .full(let full):
//         button = full.buttons[idInt]
//
//       case .fullImage(let fullImage):
//         button = fullImage.buttons[idInt]

//       default:
//         break
//       }
    
       return false
     }

}

