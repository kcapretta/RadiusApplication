//
//  FriendsControllerHelper.swift
//  Radius
//
//  Created by Kassandra Capretta on 12/6/19.
//  Copyright © 2019 Kassandra Capretta. All rights reserved.
//

import UIKit

import CoreData

import UIKit
import FirebaseAuth
import Firebase

import CoreData

extension FriendsController {
    func clearData() {
        let delegate = UIApplication.shared.delegate as? AppDelegate
        if let context = delegate?.persistentContainer.viewContext {
            let entityNames = ["Message", "Friend"]
            for entityName in entityNames {
                let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
                do {
                    messages = try context.fetch(fetchRequest) as? [Message]
                    let objects = try context.fetch(fetchRequest) as? [NSManagedObject]
                    for object in objects! {
                        context.delete(object)
                    }
                    try context.save()
                } catch let err {
                    print(err)
                }
            }
        }
    }
    func setupData() {
        clearData()
        let delegate = UIApplication.shared.delegate as? AppDelegate
        if let context = delegate?.persistentContainer.viewContext {
            let steve = NSEntityDescription.insertNewObject(forEntityName: "Friend", into: context) as! Friend
            steve.name = "Steve Jobs"
            steve.profileImageName = "steve"
            
            let zuckerberg = NSEntityDescription.insertNewObject(forEntityName: "Friend", into: context) as! Friend
            zuckerberg.name = "Mark Zuckerberg"
            zuckerberg.profileImageName = "zuckerberg"
            createSteveMessagesWithContext(context: context)
            FriendsController.createMessageWithText(text: "You'll someday connect the dots.", friend: steve, minutesAgo: 120, context: context)
            FriendsController.createMessageWithText(text: "Even though you don't understand it now", friend: steve, minutesAgo: 90, context: context)
            FriendsController.createMessageWithText(text: "You only live once. Give it all you've got.", friend: steve, minutesAgo: 30, context: context)
            FriendsController.createMessageWithText(text: "Ideas do not come out fully formed", friend: zuckerberg, minutesAgo: 60 * 24 * 10, context: context)
            FriendsController.createMessageWithText(text: "No, They dont", friend: zuckerberg, minutesAgo: 60 * 24 * 25, context: context)
            
            do {
                try context.save()
            } catch let err {
                print(err)
            }
            loadData()
        }
    }
    
    private func createSteveMessagesWithContext(context: NSManagedObjectContext) {
        let steve = NSEntityDescription.insertNewObject(forEntityName: "Friend", into: context) as! Friend
        steve.name = "Steve Jobs"
        steve.profileImageName = "steve_profile"
        
        FriendsController.createMessageWithText(text: "Good morning..", friend: steve, minutesAgo: 3, context: context)
        FriendsController.createMessageWithText(text: "Hello, how are you? Hope you are having a good morning!", friend: steve, minutesAgo: 2, context: context)
        FriendsController.createMessageWithText(text: "Are you interested in buying an Apple device? We have a wide variety of Apple devices that will suit your needs.  Please make your purchase with us.", friend: steve, minutesAgo: 1, context: context)
        
        //response message
        FriendsController.createMessageWithText(text: "Yes, totally looking to buy an iPhone 7.", friend: steve, minutesAgo: 1, context: context, isSender: true)
        
        FriendsController.createMessageWithText(text: "Totally understand that you want the new iPhone 7, but you'll have to wait until September for the new release. Sorry but thats just how Apple likes to do things.", friend: steve, minutesAgo: 1, context: context)
        
        FriendsController.createMessageWithText(text: "Absolutely, I'll just use my gigantic iPhone 6 Plus until then!!!", friend: steve, minutesAgo: 1, context: context, isSender: true)
    }
    
    static func createMessageWithText(text: String, friend: Friend, minutesAgo: Double, context: NSManagedObjectContext, isSender: Bool = false) -> Message {
        let message = NSEntityDescription.insertNewObject(forEntityName: "Message", into: context) as! Message
        message.friend = friend
        message.text = text
        message.date = NSDate().addingTimeInterval(-minutesAgo * 60) as Date
        message.isSender = NSNumber(value: isSender) as! Bool
        return message
    }
    
    func loadData() {
           let delegate = UIApplication.shared.delegate as? AppDelegate
           messages = [Message]()
           if let context = delegate?.persistentContainer.viewContext {
               if let friends = fetchFriends() {
                   for friend in friends {
                       let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Message")
                       fetchRequest.sortDescriptors = [NSSortDescriptor(key: "date", ascending: false) ]
                       fetchRequest.predicate = NSPredicate(format: "friend.name = %@", friend.name!)
                       fetchRequest.fetchLimit = 1
                       do {
                           let fetchedMessages = try context.fetch(fetchRequest) as? [Message]
                           messages?.append(contentsOf: fetchedMessages!)
                       } catch let err {
                           print(err)
                       }
                   }
                   messages = messages?.sorted(by: {$0.date!.compare($1.date!) == .orderedDescending})
               }
           }
       }
       private func fetchFriends() -> [Friend]? {
           let delegate = UIApplication.shared.delegate as? AppDelegate
           var friends: [Friend]? = [Friend]()
           if let context = delegate?.persistentContainer.viewContext {
               let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Friend")
               do {
                   friends = try context.fetch(fetchRequest) as? [Friend]
                   return friends
               } catch let err {
                   print(err)
               }
           }
           return nil
    }
}
