//
//  FadeEnabledBtn.swift
//  StarTrivia
//
//  Created by iain Allen on 11/09/2018.
//  Copyright © 2018 iain Allen. All rights reserved.
//

import UIKit

class FadeEnabledBtn: UIButton {
    
    override var isEnabled: Bool {
        didSet {
            if isEnabled {
                UIView.animate(withDuration: 0.2) {
                    self.alpha = 1.0
                }
                
            } else {
                UIView.animate(withDuration: 0.2) {
                    self.alpha = 0.5
                }
            }
        }
    }
}
