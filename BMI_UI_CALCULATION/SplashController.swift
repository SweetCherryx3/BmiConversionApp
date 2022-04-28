//
//  SplashController.swift
//  BMI_UI_CALCULATION
//
//  Created by Daniel Santos-Martinez on 4/27/22.
//

import UIKit

class SplashController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3){
            self.performSegue(withIdentifier: "splashScreen", sender: nil)
        
        }

    }
}
