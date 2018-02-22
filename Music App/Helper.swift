//
//  Helper.swift
//  Music App
//
//  Created by CREAGX on 21/02/18.
//  Copyright © 2018 SRIM. All rights reserved.
//

import UIKit
import MediaPlayer
class Helper: NSObject {

    static let sharedInstance: Helper = {
        
        let instance = Helper()
        
        return instance
    }()
    
    func musicAuthorization() {
        
        let permissionStatus = MPMediaLibrary.authorizationStatus()
        switch (permissionStatus) {
        case MPMediaLibraryAuthorizationStatus.authorized:
            print("permission status is authorized")
        case MPMediaLibraryAuthorizationStatus.notDetermined:
            print("permission status is not determined")
        //  MPMediaLibrary.requestAuthorization(MPMediaLibraryAuthorizationStatus -> permissionStatus)
        case MPMediaLibraryAuthorizationStatus.denied:
            print("permission status is denied")
        case MPMediaLibraryAuthorizationStatus.restricted:
            print("permission status is restricted")
        }
    }
}
