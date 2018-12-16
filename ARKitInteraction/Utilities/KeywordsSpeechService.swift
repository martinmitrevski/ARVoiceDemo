//
//  KeywordsSpeechService.swift
//  ARKitInteraction
//
//  Created by Martin Mitrevski on 16.12.18.
//  Copyright © 2018 Apple. All rights reserved.
//

import Foundation

class KeywordsSpeechService: SpeechService {
    
    func action(for text: String) -> SpeechAction? {
        let lowercased = text.lowercased()
        let words: [String] = lowercased
            .components(separatedBy: .punctuationCharacters)
            .joined()
            .components(separatedBy: .whitespaces)
            .filter{ !$0.isEmpty }
        return action(for: words)
    }
    
    private func action(for words: [String]) -> SpeechAction? {
        for word in words {
            if let animalType = AnimalType(rawValue: word) {
                return SpeechAction.addAnimal(animalType)
            }
            if let animateType = AnimationType(rawValue: word) {
                return SpeechAction.animateAnimal(animateType)
            }
        }
        return nil
    }
    
}
