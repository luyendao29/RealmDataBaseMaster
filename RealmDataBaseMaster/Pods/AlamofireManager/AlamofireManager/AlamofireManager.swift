//
//  AlamofireManager.swift
//
//  Created by kunpeng on 2016/12/7.
//  Copyright © 2016年 liukunpeng. All rights reserved.
//

import UIKit
import Alamofire

public class AlamofireManager {
    
    public static let manager = AlamofireManager()
    private init(){}
    //MARK: Get
    public func get(url:URLConvertible,parameters: Parameters,completion: @escaping((DataResponse<Any>) -> Void)) {
        Alamofire.request(url, method: .get, parameters: parameters).responseJSON {(response) in
                            
                            guard response.result.isSuccess else{
                                self.requestFailure(response)
                                return
                            }
                            completion(response)
        }
    }
    
    //MARK: Post
    public func post(url: URLConvertible, parameters: Parameters,completion: @escaping((DataResponse<Any>) ->Void)) {
        Alamofire.request(url, method: .post, parameters: parameters).responseJSON {(response) in
                            
                            guard response.result.isSuccess else{
                                self.requestFailure(response)
                                return
                            }
                            completion(response)
        }
    }
    
    //MARK: Uploading data
    func uploadData(url: URLConvertible, image: UIImage) {
        
        let imageData = image.pngData()!
        Alamofire.upload(imageData, to: url).responseJSON { (response) in
            debugPrint(response)
        }
    }
   
    //MARK: Uploading file
    func uploadFile(url: URLConvertible) {
        
        let fileURL = Bundle.main.url(forResource: "video", withExtension: "mov")
        Alamofire.upload(fileURL!, to: url).responseJSON { (response) in
            
        }
    }
    
    //MARK: Upload Multipart form data 
    func uploadMultipartFormData (url: URLConvertible) {
        
        Alamofire.upload(
            multipartFormData: { multipartFormData in
               // multipartFormData.append(unicornImageURL, withName: "unicorn")
                //multipartFormData.append(rainbowImageURL, withName: "rainbow")
        },
            to: url, encodingCompletion: { encodingResult in
                switch encodingResult {
                    case .success(let upload, _, _):
                        upload.responseJSON { response in
                        debugPrint(response)
                    }
                    case .failure(let encodingError):
                    print(encodingError)
                }
            }
        )
    }
    
    //MARK: Upload Progress
    func uploadWithProgress(url: URLConvertible) {
        
        let fileURL = Bundle.main.url(forResource: "video", withExtension: "mov")
        Alamofire.upload(fileURL!, to: url)
            .uploadProgress { progress in // main queue by default
                print("Upload Progress: \(progress.fractionCompleted)")
            }
            .downloadProgress { progress in // main queue by default
                print("Download Progress: \(progress.fractionCompleted)")
            }
            .responseJSON { response in
                debugPrint(response)
        }
    }
    
    //MARK: Download
    func downloadFile(url:URLConvertible) {
        Alamofire.download(url).responseData {(response) in
            //            if let data = response.result.value {
            //                let image = UIImage(data: data)
            //            }
        }
    }
    
    //MARK: Download file destination
    func downloadFileDestination(url: URLConvertible) {
        let destination = DownloadRequest.suggestedDownloadDestination(for: .documentDirectory)
        Alamofire.download(url, to: destination).responseData { (response) in
            
        }
    }
    
    //MARK: Download file with progress
    func downloadFileWithProgress(url: URLConvertible){
        Alamofire.download(url).downloadProgress { (progress) in
            print("Download progress: \(progress.fractionCompleted)")
            }.responseData { (response) in
                //            if let data = response.result.value {
                //                let image = UIImage(data: data)
                //            }
        }
    }
    
    func requestFailure(_ response:DataResponse<Any>) {
        
        print("请求失败\(response)")
    }
}
