//
//  MemeDetailViewController.swift
//  CagriInalCandidateCase
//
//  Created by Çağrı  İnal  on 6.12.2021.
//

import UIKit

class MemeDetailViewController: UIViewController {
    
    var imageView: UIImageView = {
        let imageView = UIImageView()
        let screenSize: CGRect = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        imageView.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(imageView)
    }

}
