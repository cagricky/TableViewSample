//
//  MemesViewModel.swift
//  CagriInalCandidateCase
//
//  Created by Çağrı  İnal  on 5.12.2021.
//

import Foundation

protocol MemesVMDelegate: AnyObject {
    func getMemes()
}

final class MemesViewModel {
    
    weak var delegate: MemesVMDelegate?
    let divideCount = 2
    var memeData = [Meme]()
    var memes = [Meme]()
    
    func loadData() {
        ServiceCall.shared.fetchData(completion: { [weak self] result in
            guard let response = self else {return}
            switch result {
            case .success(let memeData):
                response.memeData.append(contentsOf: memeData.data.memes)
                response.delegate?.getMemes()
                self?.loadMoreData(paginating: false)
            case.failure(_):
                break
            }
        })
    }
    
    func loadMoreData(paginating: Bool) {
        
        let chunkSize = memeData.count / divideCount
        let chunks = stride(from: 0, to: memeData.count, by: chunkSize).map {
            Array(memeData[$0..<min($0 + chunkSize, memeData.count)])
        }
        if paginating == true {
            memes.append(contentsOf: chunks[divideCount-1])
        } else {
            memes = chunks.first ?? []
        }
    }
}
