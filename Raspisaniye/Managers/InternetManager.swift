//
//  InternetManager.swift
//  Raspisaniye
//
//  Created by Ilya Mudriy on 09.02.16.
//  Copyright © 2016 rGradeStd. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class InternetManager {
    
    // MARK: GET URL list
    private let serverURL = "http://appreu.styleru.net/api"
    
    private let getGroupList   = "/groups/"
    private let getLectorsList = "/lectors/"
    private let getLessonsList = "/lessons"

    // MARK: Singleton
    static let sharedInstance = InternetManager()

    // MARK: Get lists of groups and lectors
    func getGroupList(success:JSON -> (), failure:NSError-> ()){
        HelperManager.sharedInstance.showMBProgressHUD()
        let getRequest = serverURL + getGroupList
        Alamofire.request(.GET, getRequest).responseJSON(completionHandler: {
            response in
            switch response.result {
            case .Success:
                if let value = response.result.value {
                    let json = JSON(value)
                    success(json)
                }
                HelperManager.sharedInstance.hideMBProgressHUD()
            case .Failure(let error):
                failure(error)
                HelperManager.sharedInstance.hideMBProgressHUD()
                
            }
        })
    }

    func getLectorsList(success:JSON -> (), failure:NSError-> ()){
        HelperManager.sharedInstance.showMBProgressHUD()
        let getRequest = serverURL + getLectorsList
        Alamofire.request(.GET, getRequest).responseJSON(completionHandler: {
            response in
            switch response.result {
            case .Success:
                if let value = response.result.value {
                    let json = JSON(value)
                    success(json)
                }
                HelperManager.sharedInstance.hideMBProgressHUD()
            case .Failure(let error):
                failure(error)
                HelperManager.sharedInstance.hideMBProgressHUD()
            }
        })
    }
    
    // MARK: Get schedule
    func getLessonsList(params: Dictionary<String, AnyObject>, success:JSON -> (), failure:NSError -> ()){
        HelperManager.sharedInstance.showMBProgressHUD()
        let getRequest = serverURL + getLessonsList
        Alamofire.request(.GET, getRequest, parameters: params).responseJSON(completionHandler: {
            response in
            switch response.result {
            case .Success:
                if let value = response.result.value {
                    let json = JSON(value)
                    success(json)
                }
                HelperManager.sharedInstance.hideMBProgressHUD()
            case .Failure(let error):
                failure(error)
                HelperManager.sharedInstance.hideMBProgressHUD()
            }
        })
    }
    
}






