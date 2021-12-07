//
//  KingfisherExt.swift
//  CagriInalCandidateCase
//
//  Created by Çağrı  İnal  on 6.12.2021.
//

import Foundation
import Kingfisher

extension UIImageView{
    func setKFImage(imageUrl: String){
        self.kf.setImage(with: URL(string: imageUrl))
    }
}
