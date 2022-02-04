//
//  Text.swift
//  yrwsm WatchKit Extension
//
//  Created by Fabian Kropfhamer on 04.02.22.
//

import Foundation


let emojis = [
    "😍", "😎", "🥳", "🤩", "😋", "😊"
]

let headers = [
    "You are", "Life is"
]

let bodies = [
    "awesome", "beautiful", "amazing"
]

struct DisplayText {
    let header: String
    let body: String
    
    func toString() -> String {
        return header + " " + body
    }
}

func getText() -> DisplayText {
    let emoji = emojis.randomElement() ?? "😍"
    let header = headers.randomElement() ?? "You are"
    let body = bodies.randomElement() ?? "awesome"
    
    
    return DisplayText(header: header, body: body + "! " + emoji)
}
