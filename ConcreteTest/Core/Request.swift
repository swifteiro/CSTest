//
//  Request.swift
//  ConcreteTest
//
//  Created by Vinicius on 11/09/16.
//  Copyright © 2016 vm. All rights reserved.
//

import Alamofire

enum CallType {
    case Repositories
    case Pulls
}

struct APIUrls {
    static let serverAPI                    = "https://api.github.com"
    static let pathRepositoriesAPI          = "/search/repositories"
    static let pathPullsAPI                 = "/repos/"
    static let language                     = "language:Java"
    static let sort                         = "stars"
}

struct Request {
    
    // MARK: REQUEST
    static func requestAPI(params : [String : AnyObject]?, callType: CallType,
                           successBlock : ([AnyObject]? -> ()),
                           failure failureBlock : (String? -> ())) {
        if Reachability.isConnectedToNetwork() {
            Alamofire.request(.GET, getServerURL(callType), parameters:params)
                .validate()
                .responseJSON { response in
                    switch response.result {
                    case .Success:
                        switch callType {
                        case .Repositories:
                            if let results = response.result.value as? [AnyObject] {
                                var repos = [RepositoriresModel]()
                                results.forEach({if $0 is [String : AnyObject] { repos.append(RepositoriresModel(dictionary: $0 as! [String : AnyObject]))}})
                                successBlock(repos)
                            }
                            break
                        case .Pulls:
                            break
                        }
                        break
                    case .Failure(let error):
                        print(error)
                        failureBlock("não vai dar não")
                        break
                    }
            }
        } else {
            failureBlock("Sem conexão com a internet.")
        }
    }
    
    static func getServerURL(callType: CallType) -> String {
        switch callType {
        case .Repositories:
            return (APIUrls.serverAPI) + (APIUrls.pathRepositoriesAPI)
        case .Pulls:
            return ""
//            return (APIUrls.serverAPI) + (APIUrls.pathPullsAPI) + params["full_name"] + "/pulls"
        
        }
    }
}
