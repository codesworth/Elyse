//
//  ViewController.swift
//  Elyse
//
//  Created by Shadrach Mensah on 22/03/2019.
//  Copyright © 2019 Shadrach Mensah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var imageView:UIImageView = {
        let im = UIImageView(frame:.zero)
        im.contentMode = .scaleAspectFill
        im.clipsToBounds = true
        im.isUserInteractionEnabled = true
        im.backgroundColor = .gray
        return im
    }()
    
    
    var transimageView:UIImageView = {
        let im = UIImageView(frame:.zero)
        im.contentMode = .scaleAspectFill
        im.clipsToBounds = true
        im.isUserInteractionEnabled = true
        im.backgroundColor = .gray
        return im
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageView)
        view.addSubview(transimageView)
        let tap = UITapGestureRecognizer(target: self, action: #selector(openGallery))
        tap.numberOfTapsRequired = 1
        imageView.addGestureRecognizer(tap)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        transimageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leftAnchor.constraint(equalTo: view.leftAnchor),
            imageView.rightAnchor.constraint(equalTo: view.rightAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            transimageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            transimageView.leftAnchor.constraint(equalTo: view.leftAnchor),
            transimageView.rightAnchor.constraint(equalTo: view.rightAnchor),
            transimageView.heightAnchor.constraint(equalToConstant: 200)
            ])
    }
    
    @objc func openGallery(){
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    
//    func resizeImageForUpload(image:UIImage, error:inout NSError?)->ResultData{
//        let encodeRequirement = EncodeRequirement(format: .jpeg, mode: .lossy, quality: 60)
//        let transforms = Transformations()
//        transforms.resizeRequirement = ResizeRequirement(mode: .exactOrLarger, targetSize: CGSize(width: 2048, height: 2048))
//
//        let options = EncodeOptions(encodeRequirement: encodeRequirement, transformations: transforms, metadata: nil, configuration: nil, outputPixelSpecificationRequirement: nil)
//        let data = Spectrum.shared.encodeImage(image, options: options, error: &error)
//        return data
//    }

}



extension ViewController:UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage{
            self.imageView.image = image
            var error:NSError?
//            let data = resizeImageForUpload(image: image, error: &error)
//            let tmage = UIImage(data:data.data!)
//            print("This is original size:  \(image.jpegData(compressionQuality: 1)?.count ?? 0)")
//            print("This is original Image CGsize:  \(image.size)")
//            print("This is transcoded size:  \(data.data?.count ?? 0)")
//            print("This is transcoded Image CGsize:  \(tmage?.size ?? CGSize.zero)")
//            transimageView.image = tmage
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
