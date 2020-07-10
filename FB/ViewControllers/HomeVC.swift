//
//  HomeVC.swift
//  FB
//
//  Created by Vardges Gasparyan on 2020-07-08.
//  Copyright © 2020 Vardges Gasparyan. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase
import SDWebImage

class HomeVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    var ref: DatabaseReference!
    var users: [FBUser] = []
    
    var userEmailArray = [String]()
    var userFirstNameArray = [String]()
    var userLastNameArray = [String]()
    var imageArray = [String]()
    var userCommentArray = [String]()
    var likeArray = [Int]()
    var userImageArray = [String]()
    var documentIdArray = [String]()
    
    
    let homeView: UIView = {
       
        let view = UIView()
        view.clipsToBounds  = true
        view.backgroundColor = UIColor(red: 135/255, green: 180/255, blue: 255/255, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let navView: UIView = {
       
        let view = UIView()
        view.clipsToBounds = true
        view.backgroundColor = UIColor(red: 60/255, green: 90/255, blue: 150/255, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let tableView: UITableView = {
        
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(HomeTableViewCell.self, forCellReuseIdentifier: "usersCell")
        return table
    }()
    
    let logOutBtn: UIButton = {
       
        let button = UIButton(type: UIButton.ButtonType.system)
        button.setTitle("logOut", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        button.tintColor = UIColor.init(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self,
                         action: #selector(logOutButtonTapped),
                         for: .touchUpInside)
        return button
    }()

    
    func setupTable() {
        
        view.addSubview(homeView)
        homeView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        homeView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        homeView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        homeView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        homeView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        homeView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        homeView.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: homeView.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: homeView.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: homeView.safeAreaLayoutGuide.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: homeView.safeAreaLayoutGuide.bottomAnchor, constant: 50).isActive = true
        tableView.backgroundColor = UIColor(red: 135/255, green: 180/255, blue: 255/255, alpha: 1)
//        tableView.tableFooterView = UIView()
        
        view.addSubview(navView)
        navView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        navView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        navView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
//        navView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//        navView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        navView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        navView.addSubview(logOutBtn)
//        Style.asStrokeButton(logOutBtn)
        logOutBtn.topAnchor.constraint(equalTo: navView.topAnchor, constant: 10).isActive = true
        logOutBtn.bottomAnchor.constraint(equalTo: navView.bottomAnchor, constant: -10).isActive = true
        logOutBtn.trailingAnchor.constraint(equalTo: navView.trailingAnchor, constant: -10).isActive = true
        logOutBtn.widthAnchor.constraint(equalToConstant: 60).isActive = true
        logOutBtn.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getUsers()
        
        tableView.dataSource = self
        tableView.delegate = self
        setupTable()
        
    }
    
    func getUsers() {
        
        self.userFirstNameArray = ["Vako", "Michael", "Charles"]
        self.userLastNameArray = ["Gaspar", "Jackson", "Brown"]

    }
    
    @objc func logOutButtonTapped() {
        
        do {
            try Auth.auth().signOut()
            let logInVC = self.storyboard?.instantiateViewController(identifier: Storyboards.loginViewController) as? LogInVC
            
            self.view.window?.rootViewController = logInVC
            self.view.window?.makeKeyAndVisible()
        }
        catch { print("already logged out") }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return userFirstNameArray.count
    }
    

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "usersCell", for: indexPath) as! HomeTableViewCell
        cell.backgroundColor = UIColor(red: 135/255, green: 180/255, blue: 255/255, alpha: 1)
        
        cell.userName.text = userFirstNameArray[indexPath.row]
        cell.userImage.image = UIImage(named: "Facebook_logo")
        print(userFirstNameArray)
        return cell
    }
}
