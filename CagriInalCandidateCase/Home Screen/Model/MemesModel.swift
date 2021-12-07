//
//  MemesModel.swift
//  CagriInalCandidateCase
//
//  Created by Çağrı  İnal  on 5.12.2021.
//

import Foundation

struct MemesModel: Decodable {
    var success: Bool = false
    var data = Memes()
}

struct Memes: Decodable {
    var memes = [Meme]()
}

struct Meme: Decodable {
    var id:String = ""
    var name:String = ""
    var url: String = ""
}
