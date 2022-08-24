//
//  UpdatingWoker.swift
//  MirianMAglakelidze#24
//
//  Created by Admin on 8/24/22.
//

import Foundation

class UpdaterWoker {
    
    func deleteRemainderNote(in directory: String, remainderTitle: String) {
        let createRemaindeFolderAddress = "\(String(describing: FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.path))/\(directory)/\(remainderTitle).txt"
        do {
            try FileManager.default.removeItem(atPath: createRemaindeFolderAddress)
        } catch {
            print(error)
        }
    }

    func addReminderNote(in directory: String, remainder: RemainderForm, complition: @escaping (Error?) -> Void) {
        let remainderUrl = "\(String(describing: FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.path))/\(directory)"
        guard var url = URL(string: remainderUrl) else { return }
        url.appendPathComponent("\(remainder.title).txt")
        do {
            let data = try JSONEncoder().encode(remainder)
            FileManager.default.createFile(atPath: url.path, contents: data, attributes: nil )
            complition(nil)
        } catch {
            complition(error)
        }
    }

    func editRemainderNote(in directory: String, oldRemanderName: String, remainder: RemainderForm, complition: @escaping (Error?) -> Void) {
        deleteRemainderNote(in: directory, remainderTitle: oldRemanderName)
        addReminderNote(in: directory, remainder: remainder) { error in
            complition(error)
        }
    }
}

