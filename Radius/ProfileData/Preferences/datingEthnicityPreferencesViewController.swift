//
//  ethnicityPreferencesViewController.swift
//  Radius
//
//  Created by Kassandra Capretta on 12/1/19.
//  Copyright © 2019 Kassandra Capretta. All rights reserved.
//

import UIKit

class ethnicityPreferencesViewController: UIViewController {

    @IBOutlet weak var americanIndian: UIButton!
    
    @IBOutlet weak var africanDescent: UIButton!
    
    @IBOutlet weak var eastAsian: UIButton!
    
    @IBOutlet weak var middleEastern: UIButton!
    
    @IBOutlet weak var hispanic: UIButton!
    
    @IBOutlet weak var pacificIslander: UIButton!
    
    @IBOutlet weak var southAsian: UIButton!
    
    @IBOutlet weak var caucasian: UIButton!
    
    @IBOutlet weak var openToAll: UIButton!
    
    var selectedButtons: [Int] = []
    
//    func backAction() -> Void {
//        self.navigationController?.pushViewController(true, animated: true)
 //   }
    
    @IBAction func togggleEthnicity(_ sender: UIButton) {
        updateColor(button: sender)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        Utilities.styleHollowButton(americanIndian)
        Utilities.styleHollowButton(africanDescent)
        Utilities.styleHollowButton(eastAsian)
        Utilities.styleHollowButton(middleEastern)
        Utilities.styleHollowButton(pacificIslander)
        Utilities.styleHollowButton(southAsian)
        Utilities.styleHollowButton(caucasian)
        Utilities.styleHollowButton(openToAll)
        Utilities.styleHollowButton(hispanic)
    }
    
    func updateColor(button: UIButton) {
        let tag = button.tag
        
        if let index = selectedButtons.firstIndex(of: tag) {
            selectedButtons.remove(at: index)
            Utilities.styleHollowButton(button)
        } else {
            selectedButtons.append(tag)
            Utilities.styleFilledButton(button)
        }
    }
    
    // Blocking other preferences
    // var currentUserId = Auth.auth().currentUser?.uid
   // var americanIndianBlocked =
    
    
    
//    var otherUsersId = ""
//        var isCurrentUserBlocked = false
//        var isOtherUserBlocked = false
//
//        var currentlyViewedUserId: String?
//
//
//        var usersDict: [String: LocalUser] = [:]
//        var users: [LocalUser] = []
//        
//        var userDetails: [[UserDetail: String]] = []
//
//        // Post
//        var postData = [UISwitch]()
//
//    func filterBlockedUsers(from users: [LocalUser]) {
//            var notBlockedUsers = users
//            var notBlockedUsersDict = self.usersDict
//            var blockedUsers = newUser.blocked ?? [:]
//            if let currentUserId = Auth.auth().currentUser?.uid {
//                blockedUsers[currentUserId] = true
//            }
//
//            for (userId, blocked) in blockedUsers ?? [:] {
//                print("UserId...", userId)
//                print("UserHere...", usersDict[userId])
//                if let user = usersDict[userId] {
//                    notBlockedUsersDict.removeValue(forKey: userId)
//                    /*if let blockedUserIndex = notBlockedUsers.firstIndex(where: { $0.userId! == userId }) {
//                        notBlockedUsers.remove(at: blockedUserIndex)
//                    }*/
//                }
//            }
//            let notBlocked = Array(notBlockedUsersDict.values)
//            self.users = notBlocked
//        }
//
//    override func viewDidLoad() {
//            super.viewDidLoad()
//
//    firebaseServer.fetchUsers {[weak self] (usersDict) in
//                self?.usersDict = usersDict
//                let fetchedUsers = Array(usersDict.values)
//                self?.filterBlockedUsers(from: fetchedUsers)
//                self?.loadFirstUser()
//                self?.cardView.reloadData()
//            }
//
//    // Block User Button
//         @IBAction func blockTapped(_ sender: UIButton) {
//            if let userIdToBlock = currentlyViewedUserId {
//                firebaseServer.blockSomeone(with: userIdToBlock) {[weak self] (error) in
//                    if error == nil {
//                        newUser.blocked?[userIdToBlock] = true
//                        self?.cardView.swipe(.left)
//                    }
//                }
//            }
//         }
//    }

    @IBAction func backButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}
