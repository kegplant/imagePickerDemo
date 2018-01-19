//
//  ViewController.swift
//  imagePickerTesting
//
//  Created by Song on 1/18/18.
//  Copyright © 2018 Song. All rights reserved.
//

import UIKit
import ImagePicker
//import Lightbox

class ViewController: UIViewController, ImagePickerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    lazy var button: UIButton = self.makeButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        view.addConstraint(
            NSLayoutConstraint(item: button, attribute: .centerX,
                               relatedBy: .equal, toItem: view,
                               attribute: .centerX, multiplier: 1,
                               constant: 0))
        
        view.addConstraint(
            NSLayoutConstraint(item: button, attribute: .centerY,
                               relatedBy: .equal, toItem: view,
                               attribute: .centerY, multiplier: 1,
                               constant: 0))
    }
    
    func makeButton() -> UIButton {
        let button = UIButton()
        button.setTitle("Show ImagePicker", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.addTarget(self, action: #selector(buttonTouched(button:)), for: .touchUpInside)
        
        return button
    }
    
    @objc func buttonTouched(button: UIButton) {
        var config = Configuration()
        config.doneButtonTitle = "Finish"
        config.noImagesTitle = "Sorry! There are no images here!"
        config.recordLocation = false
        config.allowVideoSelection = true
        
        let imagePicker = ImagePickerController(configuration: config)
        imagePicker.delegate = self
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    // MARK: - ImagePickerDelegate
    func cancelButtonDidPress(_ imagePicker: ImagePickerController) {
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    func wrapperDidPress(_ imagePicker: ImagePickerController, images: [UIImage]) {
        guard images.count > 0 else { return }
        
//        let lightboxImages = images.map {
//            return LightboxImage(image: $0)
//        }
//
//        let lightbox = LightboxController(images: lightboxImages, startIndex: 0)
//        imagePicker.present(lightbox, animated: true, completion: nil)
    }
    
    func doneButtonDidPress(_ imagePicker: ImagePickerController, images: [UIImage]) {
        print("displaying images")
        imageView.image=images[0]
        imagePicker.dismiss(animated: true, completion: nil)
    }
}
