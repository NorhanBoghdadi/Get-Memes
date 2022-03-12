//
//  MemesTableViewCell.swift
//  getMemes
//
//  Created by Norhan Boghdadi on 3/11/22.
//

import UIKit

class MemesTableViewCell: UITableViewCell {

    private lazy var memeImage: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.layer.cornerRadius = 5
        imgView.contentMode = .scaleToFill
        imgView.clipsToBounds = true
        return imgView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupMemes()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup ImageView
    private func setupMemes() {
        contentView.addSubview(memeImage)
        
        //MARK: - Setting Constraints
        NSLayoutConstraint.activate([
            memeImage.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
            memeImage.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor),
            memeImage.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor),
            memeImage.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor)

        ])
    }
    
    func configure(for memes: Meme)  {
        try? memeImage.setImage(url: memes.url, placeHolder: UIImage(named: "loading")!)
    }

}
