//
//  PopUpViewController.swift
//  Radius
//
//  Created by Kassandra Capretta on 1/18/20.
//  Copyright © 2020 Kassandra Capretta. All rights reserved.
//

import UIKit
import Firebase
import MessageUI
import ProgressHUD
import FirebaseFirestore

var currentlyViewedUserId: String?

var usersDict: [String: LocalUser] = [:]
var users: [LocalUser] = []

var userDetails: [[UserDetail: String]] = []
var postData = [UISwitch]()
let firebaseServer = FirebaseFunctions.shared

class PopUpViewController: UIViewController, MFMailComposeViewControllerDelegate {
    
    @IBOutlet weak var sendTapped: UIButton!
    
    @IBOutlet weak var cancelTapped: UIButton!
    
    @IBOutlet weak var initialView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Utilities.styleHollowButton(sendTapped)
        Utilities.styleHollowButton(cancelTapped)
        
        // Animate View
            func showAnimate()
            {
                self.initialView.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
                self.initialView.alpha = 0.0;
                UIView.animate(withDuration: 0.25, animations: {
                    self.initialView.alpha = 1.0
                    self.initialView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                });
            }
            
            func removeAnimate()
            {
                UIView.animate(withDuration: 0.25, animations: {
                    self.initialView.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
                    self.initialView.alpha = 0.0;
                }, completion:{(finished : Bool) in if (finished)
                {
                    self.initialView.removeFromSuperview()
                    }
                });
            }
            
            // Shadow on View
            self.initialView.layer.shadowColor = UIColor.gray.cgColor
            self.initialView.layer.shadowOpacity = 0.5
            self.initialView.layer.shadowOffset = CGSize(width: 2, height: 2)
            self.initialView.layer.shadowRadius = 6
            self.initialView.layer.masksToBounds = false
        }
        
    @IBAction func sendReport(_ sender: Any) {
        
//        let user = current.user // current user
//      let catId = cat456 // other user
//
//      func actionSheetBlockedAction() {
//
//          let dictValues = [String: Any]()
//          dictValues.updateValue(true, forKey: catId)
//
//          let ref = Database.database().reference().child("blocked").child(currentlyViewedUserId)
//          ref.updateChildValues(dictValues)
//      }
    }
        
        
        
//        let mailComposeViewController = configureMailController()
//        if MFMailComposeViewController.canSendMail() {
//            self.present(mailComposeViewController, animated:true, completion: nil) }
//        else {
//            showMailError()
//        }

    
    
//    func configureMailController() -> MFMailComposeViewController {
//        let mailComposerVC = MFMailComposeViewController()
//        mailComposerVC.mailComposeDelegate = self
//
//        mailComposerVC.setToRecipients(["RadiusAppHelp@gmail.com"])
//        mailComposerVC.setSubject("Reporting user")
//        mailComposerVC.setMessageBody("Please include as much detail as possible:", isHTML: false)
//
//        return mailComposerVC
//    }
//
//    func showMailError() {
//        let sendMailErrorAlert = showAlert(withTitle: "Could not send message", message: "Please try again")
//        let dismiss = UIAlertAction(title: "Okay", style: .default, handler: nil)
////        sendMailErrorAlert.addAction(dismiss)
////        self.present(sendMailErrorAlert, animated: true, completion: nil)
//    }
//
//    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
//        controller.dismiss(animated: true, completion: nil)
//    }
    
    
//    @IBAction func showPopUp(_ sender: Any) {
//           let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "sbPopUpID") as! PopUpViewController
//           self.addChild(popOverVC)
//           popOverVC.view.frame = self.view.frame
//           self.view.addSubview(popOverVC.view)
//           popOverVC.didMove(toParent: self)
//       }
}
