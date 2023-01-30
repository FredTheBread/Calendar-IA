//
//  HomeController.swift
//  Calendar
//
//  Created by Michael Cole on 30.01.23.
//

import Foundation
import UIKit

class HomeController: UIViewController {
    @IBAction func OpenSettings(sender: AnyObject) {
            let storyboard = UIStoryboard(name: "Main", bundle: nil);
        let vc = storyboard.instantiateViewController(withIdentifier: "Settings") ; // MySecondSecreen the storyboard ID
        self.present(vc, animated: true, completion: nil);
    }
}