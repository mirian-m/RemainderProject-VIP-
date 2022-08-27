//
//  RemainderForm.swift
//  MirianMAglakelidze#24
//
//  Created by Admin on 8/24/22.
//

import Foundation

struct ReminderForm: Codable {
    var id = UUID().uuidString
    var title: String
    var body: String
    var date: Date
}


