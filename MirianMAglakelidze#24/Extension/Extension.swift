//
//  Extension.swift
//  MirianMAglakelidze#24
//
//  Created by Admin on 8/27/22.
//

import Foundation
import UIKit

extension Date {
    func getFormattedDate(format: String) -> String {
         let dateformat = DateFormatter()
         dateformat.dateFormat = format
         return dateformat.string(from: self)
     }
 }
