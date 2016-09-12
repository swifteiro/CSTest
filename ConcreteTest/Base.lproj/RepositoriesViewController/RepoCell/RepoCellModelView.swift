//
//  RepoCellModelView.swift
//  ConcreteTest
//
//  Created by Vinicius on 12/09/16.
//  Copyright © 2016 vm. All rights reserved.
//

import UIKit

class RepoCellModelView: NSObject, RepoCellRepresentation {

    var repos: RepositoriresModel?
    
    init(repos: RepositoriresModel) { self.repos = repos }
    
    func setCellTitle() -> String { return self.repos?.name ?? "" }
    func setCellSubtitle() -> String { return self.repos?.description ?? "" }
    func setForksCount() -> String { return self.repos?.forks_count ?? "" }
    func setStarsCount() -> String { return self.repos?.stargazers_count ?? "" }
    func setImageProfileName() -> String { return self.repos?.avatar_url ?? "" }
}
