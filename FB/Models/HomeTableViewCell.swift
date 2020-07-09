//
//  HomeTableViewCell.swift
//  FB
//
//  Created by Vardges Gasparyan on 2020-07-08.
//  Copyright © 2020 Vardges Gasparyan. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    let userInfoView: UIView = {
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    
    let cellStackView: UIStackView = {
    
        let stackView = UIStackView()
        stackView.axis = NSLayoutConstraint.Axis.vertical
        stackView.distribution = UIStackView.Distribution.fill
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let userImage: UIImageView = {
       
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 20
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "Facebook_logo")
        imageView.layer.shadowColor = UIColor.black.cgColor
        imageView.layer.shadowOpacity = 0.5
        imageView.layer.shadowOffset = CGSize(width: -1, height: 1)
        imageView.layer.shadowRadius = 1
        return imageView
    }()
    
    let userName: UILabel = {
        
        let label = UILabel()
        label.textAlignment = .left
        label.text = "Barlus Barilusyan"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.init(red: 60/255, green: 90/255, blue: 150/255, alpha: 1)
        return label
    }()
    
    let userActionView: UIView = {
       
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupCell()
    }
    
    func setupCell() {
        
        self.contentView.addSubview(cellStackView)
        cellStackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        cellStackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        cellStackView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        cellStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        cellStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        cellStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        
        self.cellStackView.addArrangedSubview(userInfoView)
        userInfoView.heightAnchor.constraint(equalTo: cellStackView.heightAnchor, multiplier: 0.2).isActive = true
        userInfoView.widthAnchor.constraint(equalTo: cellStackView.widthAnchor).isActive = true
        userInfoView.leadingAnchor.constraint(equalTo: cellStackView.leadingAnchor).isActive = true
        userInfoView.trailingAnchor.constraint(equalTo: cellStackView.trailingAnchor).isActive = true
        userInfoView.topAnchor.constraint(equalTo: cellStackView.topAnchor).isActive = true
        
        self.cellStackView.addArrangedSubview(userActionView)
        userActionView.heightAnchor.constraint(equalTo: cellStackView.heightAnchor, multiplier: 0.8).isActive = true
        userActionView.widthAnchor.constraint(equalTo: cellStackView.widthAnchor).isActive = true
        userActionView.leadingAnchor.constraint(equalTo: cellStackView.leadingAnchor).isActive = true
        userActionView.trailingAnchor.constraint(equalTo: cellStackView.trailingAnchor).isActive = true
        userActionView.bottomAnchor.constraint(equalTo: cellStackView.bottomAnchor).isActive = true
        
        self.userInfoView.addSubview(userImage)
        userImage.heightAnchor.constraint(equalToConstant: 40).isActive = true
        userImage.widthAnchor.constraint(equalToConstant: 40).isActive = true
        userImage.topAnchor.constraint(equalTo: userInfoView.topAnchor, constant: 10).isActive = true
        userImage.bottomAnchor.constraint(equalTo: userInfoView.bottomAnchor).isActive = true
        userImage.leadingAnchor.constraint(equalTo: userInfoView.leadingAnchor, constant: 10).isActive = true
        
        self.userInfoView.addSubview(userName)
        userName.leadingAnchor.constraint(equalTo: userImage.trailingAnchor, constant: 10).isActive = true
        userName.trailingAnchor.constraint(equalTo: userInfoView.trailingAnchor, constant: 10).isActive = true
        userName.topAnchor.constraint(equalTo: userInfoView.topAnchor, constant: 5).isActive = true
        userName.bottomAnchor.constraint(equalTo: userInfoView.bottomAnchor, constant: 5).isActive = true

    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
