//
//  NetworkManager.swift
//  Westwing_Challenge
//
//  Created by Mohamed Magdy on 8/11/16.
//  Copyright © 2016 Mohamed Magdy. All rights reserved.
//

import Foundation
import Alamofire

class NetworkManager {
    
    class func performRequestWithPath(path: String, requestMethod: Alamofire.Method, parameters:[String: AnyObject]?, headers:[String: String]?, success:(AnyObject?) -> Void, failure:(NSError) -> Void) {
        
        let url = String(format: "%@%@", Network.baseURL,path)
        
        Alamofire.request(requestMethod, url, parameters: parameters, encoding: .URL, headers: headers)
            
            .responseJSON { (response) in
                
                switch response.result {
                    
                case .Success(_):
                    success(response.result.value)
                case .Failure(let error):
                    failure(error)
                }
                
        }

    }
    
}