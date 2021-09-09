//
//  UserDefaultManager.swift
//  iOS-EVAL-4
//
//  Created by Student06 on 09/09/2021.
//

import Foundation

class UserDefaultManager {
    static let shared = UserDefaultManager()
    
    private let userDefault = UserDefaults.standard
    private let dataFilledKey = "dataFilledKey"

    
    var dataFilled: Bool {
        get {
            return userDefault.bool(forKey: dataFilledKey)
        }
        set(newValue) {
            userDefault.setValue(newValue, forKey: dataFilledKey)
        }
    }
}
