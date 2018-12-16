//
//  SpeechService.swift
//  ARKitInteraction
//
//  Created by Martin Mitrevski on 16.12.18.
//  Copyright © 2018 Apple. All rights reserved.
//

import Foundation

enum SpeechAction {
    case addAnimal(AnimalType)
    case animateAnimal(AnimationType)
}

protocol SpeechService {
    func action(for text: String) -> SpeechAction?
}
