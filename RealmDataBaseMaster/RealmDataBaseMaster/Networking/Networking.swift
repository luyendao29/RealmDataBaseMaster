//
//  Networking.swift
//  RealmDataBaseMaster
//
//  Created by Boss on 10/2/19.
//  Copyright © 2019 LuyệnĐào. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class Networking {
    static let sharedInstance: Networking = Networking()
    
    func getUserInfo(completedHandle: @escaping([UserInfo]) -> Void, failure: @escaping(String) -> Void) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos") else { return }
        
        let parameters: Parameters = [:]
        let headers: HTTPHeaders = [:]
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseArray { (data: DataResponse<[UserInfo]>) in
            switch data.result {
            case .success:
                completedHandle(data.result.value!)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
