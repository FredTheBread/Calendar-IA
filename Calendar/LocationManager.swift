import UIKit
import MapKit

class LocationManager: UIViewController, UISearchResultsUpdating {
    
    let map = MKMapView()
    
    let search = UISearchController(searchResultsController: SearchViewController())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Location"
        view.addSubview(map)
        search.searchBar.backgroundColor = .systemBlue
        search.searchResultsUpdater = self
        navigationItem.searchController = search
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        map.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.frame.size.width, height: view.frame.size.height - view.safeAreaInsets.top)
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        
    }
}
