//
//  PhotoUploadViewController.swift
//  Radius
//
//  Created by Kassandra Capretta on 11/14/19.
//  Copyright © 2019 Kassandra Capretta. All rights reserved.
//

import UIKit
import FirebaseStorage
import FirebaseAuth
import Firebase

class PhotoUploadViewController: BaseViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    // MARK:- Interface Builder
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var containingView: UIView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    let firebaseServer = FirebaseFunctions.shared
    
    // MARK:- ViewController LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Hide "Back"
        let backButton = UIBarButtonItem()
        backButton.title = ""
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleImageViewTapped))
        containingView.addGestureRecognizer(tapGesture)
        
    }

    
    // Image Tapped
    @objc func handleImageViewTapped() {
        print("Containing view...")
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        print("Image... ", image)
        profileImageView.image = image
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }

    // MARK:- Private Methods
    // Confirm data, save and move to next View Controller
    @IBAction func nextVCInfo(_ sender: Any) {
        if let image = profileImageView.image,
            let uid = Auth.auth().currentUser?.uid{
            let storage = Storage.storage()
            let storageRef = storage.reference(withPath: "\(uid)/profilepicture")
            PhotoUploader.uploadImage(image, at: storageRef) {[weak self] (url) in
                if url != nil {
                    print("url... ", url)
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let nextVCI = storyboard.instantiateViewController(identifier: "informationViewController")
                    self?.navigationController?.pushViewController(nextVCI, animated: true)
                } else {
                    self?.showAlert(withTitle: "Error", message: "Image Upload Failed")
                }
            }
        } else {
            showAlert(withTitle: "Error", message: "No Image Selected")
        }
    }
}


// Upload Photo to Firebase
struct PhotoUploader {
    static func uploadImage(_ image: UIImage, at reference: StorageReference, completion: @escaping (URL?) -> Void) {
        // Reduce quality for easy Firebase upload
        guard let imageData = image.jpegData(compressionQuality: 0.1) else {
            return completion(nil)
        }

        // Upload data
        reference.putData(imageData, metadata: nil, completion: { (metadata, error) in
            // Check for errors
            if let error = error {
                assertionFailure(error.localizedDescription)
                return completion(nil)
            }

            // If everything's correct, download URL
            reference.downloadURL(completion: { (url, error) in
                if let error = error {
                    assertionFailure(error.localizedDescription)
                    return completion(nil)
                }
                completion(url)
            })
        })
    }
    
    static func downloadImageUrl(from ref: StorageReference, completion: @escaping (URL?) -> Void) {
        ref.downloadURL { (url, error) in
            print("ERROR", url, error)
            completion(url)
        }
    }
}
