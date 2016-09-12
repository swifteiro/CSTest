//
//  RepositoriesRepresentation.swift
//  ConcreteTest
//
//  Created by Vinicius on 12/09/16.
//  Copyright © 2016 vm. All rights reserved.
//

protocol RepositoriesRepresentation {
    var arrayRepo: [RepositoriresModel] { get }
    
    func getRepos(successBlock: (Void -> ()),
                  failure failureBlock: (String? -> ()))
}
