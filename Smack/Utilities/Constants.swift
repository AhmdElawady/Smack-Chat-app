//
//  Constants.swift
//  Smack
//
//  Created by Awady on 8/29/19.
//  Copyright © 2019 Awady. All rights reserved.
//

import Foundation


typealias CompletionHandler = (_ Success: Bool) -> ()

// URL constants
let BASE_URL = "www.ghjk.com"
let URL_REGISTER = "\(BASE_URL)/register"
let URL_LOGIN = "\(BASE_URL)/login"
let URL_USER_ADD = "\(BASE_URL)user/add"

// Segues
let TO_LOGIN = "toLogin"
let TO_CREATE_ACCOUNT = "toCreateAccount"
let UNWIND = "unwindToChannel"

// User Defaults
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"

//Headers
let HEADER = [
    "Content-Type": "Aplication/Json; charset=utf-8"
]

