//
//  AnimalsService.swift
//  ARKitInteraction
//
//  Created by Vilijan Monev on 12/11/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import Foundation

class AnimalsService {
    
    var animationsDetails: [AnimationDetails]
    
    init() {
        let url = Bundle.main.url(forResource: "animals", withExtension: "json")!
        animationsDetails = [AnimationDetails]()
        do {
            
            let data = try Data(contentsOf: url, options: .mappedIfSafe)
            let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
            
            if let json = json as? Dictionary<String, AnyObject> {
                if let animals = json["animals"] as? [[String : AnyObject]] {
                    for animal in animals {
                        let animalType = animal["animalType"] as! String
                        if let animations = animal["animations"] as? [[String : AnyObject]] {
                            let currAnimations = getAnimationsDetails(for: animalType, from: animations)
                            animationsDetails.append(contentsOf: currAnimations)
                        }
                    }
                }
            }
            
        } catch {
            
        }
        
       
    }
    
    func animationDetails(for animal: AnimalType, animationType: AnimationType) -> AnimationDetails? {
        for animationDetail in animationsDetails {
            if animationDetail.animalType == animal && animationDetail.animationType == animationType {
                return animationDetail
            }
        }
        return nil
    }
    
    private func getAnimationsDetails(for animalType: String, from animations: [[String : AnyObject]]) -> [AnimationDetails] {
        var temp = [AnimationDetails]()
        for animation in animations {
            let currAnimationDetails = AnimationDetails(animalType: AnimalType(rawValue: animalType)!,
                                                        startTime: animation["startTime"] as! Double,
                                                        duration: animation["duration"] as! Double,
                                                        animationType: AnimationType(rawValue: animation["animationType"] as! String)!)
            temp.append(currAnimationDetails)
        }
        
        return temp
    }
  
}
