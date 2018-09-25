//
//  BlackBgView.swift
//  StarTrivia
//
//  Created by iain Allen on 07/09/2018.
//  Copyright © 2018 iain Allen. All rights reserved.
//

import UIKit

class BlackBgView: UIView {
    
    
    override func awakeFromNib() {
        layer.backgroundColor = blackBg
        layer.cornerRadius = 10
    }
}

class BlackBgButton: UIButton {
    
    override func awakeFromNib() {
        layer.backgroundColor = blackBg
        layer.cornerRadius = 10
    }
}

