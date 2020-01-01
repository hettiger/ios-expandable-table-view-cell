//
//  HairlineConstraint.swift
//  Expandable Table View Cell
//
//  Created by Martin Hettiger on 01.01.20.
//  Copyright © 2020 Hettiger IT-Dienstleistungen. All rights reserved.
//

import UIKit

class HairlineConstraint: NSLayoutConstraint {

    override func awakeFromNib() {
        super.awakeFromNib()
        self.constant = 1.0 / UIScreen.main.scale
    }

}
