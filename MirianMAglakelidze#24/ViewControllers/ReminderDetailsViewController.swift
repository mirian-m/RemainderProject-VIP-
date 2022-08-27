//
//  ViewController.swift
//  MirianMAglakelidze#24
//
//  Created by Admin on 8/27/22.
//

import UIKit

class ReminderDetailsViewController: UIViewController {
    var reminder: ReminderForm?
    @IBOutlet weak var backDirectoryBtn: UIButton! {
        didSet {
            backDirectoryBtn.layer.cornerRadius = 10
            backDirectoryBtn.backgroundColor = .systemBlue
            backDirectoryBtn.setTitleColor(.black, for: .normal)
        }
    }
    @IBOutlet weak var reminderTitle: UILabel! {
        didSet {
            reminderTitle.text = reminder?.title
        }
    }
    @IBOutlet weak var reminderBody: UILabel! {
        didSet {
            reminderBody.text = reminder?.body
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Reminder Details"
    }

    @IBAction func moveBack(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "DirectoryFileViewController") else { return }
        navigationController?.pushViewController(vc, animated: true)
    }
}
