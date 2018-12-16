//
//  RoundedButton.swift
//  ARKitInteraction
//
//  Created by Vilijan Monev on 12/13/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class RoundedButton: UIButton {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        layer.cornerRadius = layer.frame.width / 2
        layer.shadowOpacity = 0.65
        layer.shadowRadius = 6
        layer.shadowOffset = CGSize(width: 0, height: 0)
    }

}
