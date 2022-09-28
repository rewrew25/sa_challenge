//
//  ViewController.swift
//  IterableSAchallenge
//
//  Created by Rachel West on 9/27/22.
//

import UIKit
import IterableSDK

class ViewController: UIViewController {

    @IBAction func updateUserToIterable(_ sender: UIButton) {
        let dataField: [String: Any] = [
                "firstName": "Rachel",
                "isRegisteredUser": true,
                "SA_User_Test_Key": "completed"
                ]
            
            IterableAPI.updateUser(dataField,
                                   mergeNestedObjects: false,
                                   onSuccess: myUserUpdateSuccessHandler,
                                   onFailure: myUserUpdateFailureHandler)
        }

        func myUserUpdateSuccessHandler(data: [AnyHashable: Any]?) -> () {
            print("Successfully sent user update request to Iterable")
        }

        func myUserUpdateFailureHandler(reason: String?, data: Data?) -> () {
            print("Failure sending user update request to Iterable")
        }
    
    @IBAction func sendCustomEvent(_ sender: UIButton) {
        IterableAPI.track(
            event: "mobileSATestEvent",
            dataFields: ["platform": "iOS",
                         "isTestEvent": true,
                         "url": "https://iterable.com/sa-test/rachel",
                         "secret_code_key": "Code_123"
                        ]
        )
    }
    
   func getIterableMessage() {
        let messages = IterableAPI.inAppManager.getMessages()

        if messages.isEmpty {
            print("there are 0 messages")
        } else {
            print("presents the first message")

            // Show the in-app message
            IterableAPI.inAppManager.show(message: messages[0])
        }
    }
    
    
}

