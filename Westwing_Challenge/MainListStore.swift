//
//  MainListStore.swift
//  Westwing_Challenge
//
//  Created by Mohamed Magdy on 8/11/16.
//  Copyright © 2016 Mohamed Magdy. All rights reserved.
//

import Foundation
import ObjectMapper

class MainListStore {
    
    class func getMainListWithSuccess(success:([MainListModel]?) -> Void, failure:(NSError) -> Void) {
        
        NetworkManager.performRequestWithPath(Network.mainListPath, requestMethod: .GET, parameters: nil, headers: nil, success: { (response) in
            
            let list: Array<MainListModel> = Mapper<MainListModel>().mapArray(response)!
            success(list)
            
            }) { (error) in
                failure(error)
        }
        
    }
    
}