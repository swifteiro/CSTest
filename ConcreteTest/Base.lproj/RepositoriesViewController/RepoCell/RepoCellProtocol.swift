//
//  RepoCellProtocol.swift
//  ConcreteTest
//
//  Created by Vinicius on 12/09/16.
//  Copyright © 2016 vm. All rights reserved.
//

import UIKit

protocol RepoCellRepresentation {
    func setCellTitle() -> String
    func setCellSubtitle() -> String
    func setForksCount() -> String
    func setStarsCount() -> String
    func setImageProfileName() -> String
}
