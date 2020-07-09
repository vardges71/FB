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
    var userNameArray = [String]()
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
    
    let tableView: UITableView = {
        
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(HomeTableViewCell.self, forCellReuseIdentifier: "usersCell")
        return table
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
        tableView.bottomAnchor.constraint(equalTo: homeView.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.backgroundColor = UIColor(red: 135/255, green: 180/255, blue: 255/255, alpha: 1)
//        tableView.tableFooterView = UIView()
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        setupTable()
        getUsers()
    }
    
    func getUsers() {
        
        
        do { try Auth.auth().signOut() }

        catch { print("already logged out") }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return userEmailArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "usersCell", for: indexPath) as! HomeTableViewCell
        cell.backgroundColor = UIColor(red: 135/255, green: 180/255, blue: 255/255, alpha: 1)
        
        cell.userName.text = userNameArray[indexPath.row]
        
        return cell
    }
}
