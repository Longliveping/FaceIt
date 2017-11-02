//
//  EmotionsViewController.swift
//  FaceIt
//
//  Created by 龙利平 on 07/09/2017.
//  Copyright © 2017 long. All rights reserved.
//

import UIKit

class EmotionsViewController: VCLLoggingViewController {

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var destinationViewController = segue.destination
        if let navigationController = destinationViewController as? UINavigationController {
            destinationViewController = navigationController.visibleViewController ?? destinationViewController
        }
        if let faceViewController = destinationViewController as? FaceViewController,
            let identifier = segue.identifier,
            let expression = emotionalFaces[identifier] {
                faceViewController.expression = expression
            faceViewController.navigationItem.title = (sender as? UIButton)?.currentTitle
             }
    }
    
    private let emotionalFaces: Dictionary<String, FacialExpression> = [
        "sad" : FacialExpression(eyes: .Closed, mouth: .Frown),
        "happy" : FacialExpression(eyes: .Open, mouth: .Smile),
        "worried" : FacialExpression(eyes: .Open, mouth: .Smirk),
    ]
 
}
