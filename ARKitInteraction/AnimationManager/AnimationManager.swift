//
//  AnimationManager.swift
//  ARKitInteraction
//
//  Created by Vilijan Monev on 12/11/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit
import SceneKit

class AnimationManager {
    
    static func stopAllAnimations(for virtualObject: VirtualObject) {
        let basicAnimationPlayer = getAnimationPlayer(from: virtualObject, named: "unnamed_animation__0")
        basicAnimationPlayer?.stop()
        
        for animationKey in virtualObject.animationKeys {
            if let currPlayer = virtualObject.animationPlayer(forKey: animationKey) {
                currPlayer.stop()
            }
        }
    }
    
    static func startBasicAnimation(for virtualObject: VirtualObject) {
        let basicAnimationPlayer = getAnimationPlayer(from: virtualObject, named: "unnamed_animation__0")!
        basicAnimationPlayer.play()
    }
    
    static func startCustomAnimation(for virtualObject: VirtualObject, animationDetails: AnimationDetails) {
        
        let basicAnimation = AnimationManager.getAnimationPlayer(from: virtualObject, named: "unnamed_animation__0")!.animation
        
        
        let currAnimation = AnimationManager.cropAnimation(from: basicAnimation,
                                                           startTime: animationDetails.startTime,
                                                           duration: animationDetails.duration)
        
        let currAnimationPlayer = SCNAnimationPlayer(animation: currAnimation)
        
        virtualObject.addAnimationPlayer(currAnimationPlayer, forKey: animationDetails.animationType.rawValue)
        currAnimationPlayer.play()
    }
    
    static func getAnimationPlayer(from virtualObject: VirtualObject, named name: String) -> SCNAnimationPlayer? {
        var animationPlayer = virtualObject.animationPlayer(forKey: name)
        
        for childNode in virtualObject.childNodes {
            if let currAnimationPlayer = childNode.animationPlayer(forKey: name) {
                animationPlayer = currAnimationPlayer
            }
        }
        
        return animationPlayer
    }
    
    
    static func cropAnimation(from fullAnimation: SCNAnimation,
                              startTime: Double,
                              duration: Double) -> SCNAnimation {
        
        let fullCAAnimaition = CAAnimation(scnAnimation: fullAnimation)
        
        let animation = CAAnimationGroup()
        
        let cropedAnimation = fullCAAnimaition.copy() as! CAAnimation
        cropedAnimation.timeOffset = startTime
        
        animation.animations = [cropedAnimation]
        animation.duration = duration
        
        return SCNAnimation(caAnimation: animation)
    }
    
}
