//
//  AnimationDetails.swift
//  ARKitInteraction
//
//  Created by Vilijan Monev on 12/11/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import Foundation

enum AnimalType: String {
    case dog = "dog"
    case pony = "pony"
}

enum AnimationType: String {
    case jump = "jump"
    case sit = "sit"
    case lay = "crazy"
    case yes = "yes"
}

struct AnimationDetails {
    let animalType: AnimalType
    let startTime: Double
    let duration: Double
    let animationType: AnimationType
}
