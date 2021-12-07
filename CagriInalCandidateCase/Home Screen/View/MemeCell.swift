//
//  MemeCell.swift
//  CagriInalCandidateCase
//
//  Created by Çağrı  İnal  on 5.12.2021.
//

import UIKit
import Kingfisher

class MemeCell: UITableViewCell {

    var memeImageView = UIImageView()
    var memeTitleLabel = UILabel()
    
    var meme: Meme? {
        didSet{
            memeImageView.setKFImage(imageUrl: meme?.url ?? "")
            memeTitleLabel.text = meme?.name
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(memeImageView)
        addSubview(memeTitleLabel)
        
        configureImageView()
        configureNameLabel()
        setImageConstraints()
        setTitleLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureImageView() {
        memeImageView.layer.masksToBounds = true
        memeImageView.layer.cornerRadius = 6
    }
    
    func configureNameLabel() {
        memeTitleLabel.numberOfLines = 0
        memeTitleLabel.adjustsFontSizeToFitWidth = true
    }
    
    func setImageConstraints() {
        memeImageView.translatesAutoresizingMaskIntoConstraints = false
        memeImageView.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        memeImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        memeImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        memeImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -(frame.height)).isActive = true
    }
    
    func setTitleLabelConstraints() {
        memeTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        memeTitleLabel.topAnchor.constraint(equalTo: memeImageView.bottomAnchor).isActive = true
        memeTitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        memeTitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
}
