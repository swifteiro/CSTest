//
//  Repositorires.swift
//  ConcreteTest
//
//  Created by Vinicius on 12/09/16.
//  Copyright © 2016 vm. All rights reserved.
//

import UIKit
import JSONHelper

class RepositoriresModel: Deserializable {

    dynamic var name                = ""
    dynamic var full_name           = ""
    dynamic var login               = ""
    dynamic var avatar_url          = ""
    dynamic var description         = ""
    dynamic var forks_count         = ""
    dynamic var stargazers_count    = ""
    
    required init(dictionary: [String : AnyObject]) {
        name                <-- dictionary["name"]
        full_name           <-- dictionary["full_name"]
        login               <-- dictionary["owner"]?["login"]
        avatar_url          <-- dictionary["owner"]?["avatar_url"]
        description         <-- dictionary["description"]
        forks_count         <-- dictionary["forks"]
        stargazers_count    <-- dictionary["stargazers_count"]
    }
}
