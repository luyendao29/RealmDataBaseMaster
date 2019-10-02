//
//  ViewController.swift
//  RealmDataBaseMaster
//
//  Created by Boss on 10/2/19.
//  Copyright © 2019 LuyệnĐào. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var users: [UserInfo]?

    override func viewDidLoad() {
        super.viewDidLoad()
        let path = DBManager.sharedDB.realm.configuration.fileURL
        print("path: ", path!)
        callUserInfo()
    }
    
    
    // get API
    func callUserInfo() {
        Networking.sharedInstance.getUserInfo(completedHandle: { [weak self] data in
            self!.users = data
            for index in 0..<self!.users!.count {
                self!.callRealm(index: index)
            }
            }, failure: { message in
                
        })
    }
    
    func callRealm(index: Int) {
        DBManager.sharedDB.saveAll(userID: "\(users![index].userId ?? 87)", id: "\(String(describing: users![index].id!))", title: users![index].title!, completed: "\(String(describing: users![index].completed!))")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DBManager.sharedDB.realm.objects(UserModel.self).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MainTableViewCell
        
        let resutls = DBManager.sharedDB.realm.objects(UserModel.self)
        cell.useridLabel.text = resutls[indexPath.row].userID
        cell.idLabel.text = resutls[indexPath.row].id
        cell.titleLable.text = resutls[indexPath.row].title
        cell.completedLabel.text = resutls[indexPath.row].completed
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let editVC = storyboard?.instantiateViewController(withIdentifier: "addVCID") as! AddVC
        editVC.detailUsers = users![indexPath.row]
        present(editVC, animated: true, completion: nil)
    }

    @IBAction func onAddClicked(_ sender: Any) {
        
    }
    
    @IBAction func onDeleteAllClicked(_ sender: Any) {
        DBManager.sharedDB.deleteALL()
    }
}

