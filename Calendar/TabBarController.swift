import UIKit

// Subclass UITabBarController to create a custom TabBarController
class TabBarController: UITabBarController {
    
    // An IBInspectable property to set the initial index of the tab bar
    @IBInspectable var initialIndex: Int = 0
    
    // Override viewDidLoad to set the selected index of the tab bar to the initial index
    override func viewDidLoad() {
        // Call the super class's viewDidLoad function
        super.viewDidLoad()
        
        // Set the selected index of the tab bar to the initial index
        selectedIndex = initialIndex
    }
}
