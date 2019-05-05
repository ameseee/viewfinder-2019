//
//  AddPhotoViewController.swift
//  view-finder-practice
//
//  Created by Amy Holt on 5/5/19.
//  Copyright © 2019 Amy Holt. All rights reserved.
//

import UIKit

class AddPhotoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var imagePicker = UIImagePickerController()
    
    @IBOutlet weak var newImage: UIImageView!
    @IBOutlet weak var newCaption: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            newImage.image = selectedImage
        }
        
        imagePicker.dismiss(animated: true, completion: nil)
    }

    @IBAction func takePhotoTapped(_ sender: UIButton) {
        imagePicker.sourceType = .camera
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func selectLibraryTapped(_ sender: UIButton) {
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func savePhotoTapped(_ sender: UIButton) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
                let photoToSave = Photos(entity: Photos.entity(), insertInto: context)
                photoToSave.caption = newCaption.text
            
            if let userImage = newImage.image {
                
                if let userImageData = userImage.pngData() {
                    photoToSave.imageData = userImageData
                }
            }
            (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
            navigationController?.popViewController(animated: true)
        }
    }
    
}
