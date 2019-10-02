//
//  AddVC.swift
//  RealmDataBaseMaster
//
//  Created by Boss on 10/2/19.
//  Copyright © 2019 LuyệnĐào. All rights reserved.
//

import UIKit

class AddVC: UIViewController {
    @IBOutlet weak var userIdTextField: UITextField!
    
    @IBOutlet weak var idTextField: UITextField!
    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var completeTextField: UITextField!
    
    var detailUsers: UserInfo?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userIdTextField.text = "\(String(describing: detailUsers?.userId))"
        idTextField.text = "\(String(describing: detailUsers?.id))"
        titleTextField.text = detailUsers?.title
        completeTextField.text = "\(String(describing: detailUsers?.completed))"
    }

}
