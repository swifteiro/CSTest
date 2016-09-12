//
//  RepositoriesViewModel.swift
//  ConcreteTest
//
//  Created by Vinicius on 12/09/16.
//  Copyright © 2016 vm. All rights reserved.
//

import UIKit

class RepositoriesViewModel: NSObject, RepositoriesRepresentation {

    var arrayRepo = [RepositoriresModel]()
    
    func getRepos(successBlock: (Void -> ()),
                  failure failureBlock: (String? -> ())) {
        Request.requestAPI(["q" : APIUrls.language, "sort" : APIUrls.sort, "page" : "1"], callType: .Repositories, successBlock: { (repositories) in
            if repositories?.count > 0 {
                if let rep :[RepositoriresModel] = repositories as? [RepositoriresModel] {
                    self.arrayRepo = rep
                }
                successBlock()
            }
        }) { (stringError) in
            failureBlock(stringError)
        }
    }
}
