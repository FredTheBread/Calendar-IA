import UIKit
import MapKit
import CoreLocation
import FloatingPanel

class HomeController: UIViewController, SearchViewControllerDelegate {
//    private let map: MKMapView = {
//        let map = MKMapView()
//        return map
//    }()
    
    let map = MKMapView()
    let panel = FloatingPanelController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(map)
        //title = "Location"
        
        LocationManager.shared.getUserLocation { [weak self] location in //weak self is used to stop memory leak
            DispatchQueue.main.async {
                guard let strongSelf = self else {
                    return
                }
                strongSelf.mapPin(with: location)
            }
        }
        
        let searchVC = SearchViewController()
        searchVC.delegate = self
        panel.set(contentViewController: searchVC)
        panel.addPanel(toParent: self)
    }
    
    func mapPin(with location: CLLocation) {
        let pin = MKPointAnnotation()
        pin.coordinate = location.coordinate
        map.setRegion(MKCoordinateRegion(center: location.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.7, longitudeDelta: 0.7)), animated: true)
        map.addAnnotation(pin)
        
        LocationManager.shared.locationName(with: location) { [weak self] locationName in
            self?.title = locationName
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        map.frame = view.bounds
    }
    
    
    func searchViewController(_ vc: SearchViewController, didSelectLocationWith coordinates: CLLocationCoordinate2D?) {
        map.removeAnnotations(map.annotations)
        
        guard let coordinates = coordinates else {
            return
        }
        
        panel.move(to: .tip, animated: true)
        
        let pin = MKPointAnnotation()
        pin.coordinate = coordinates
        map.addAnnotation(pin)
        
        map.setRegion(MKCoordinateRegion(center: coordinates, span: MKCoordinateSpan(
            latitudeDelta: 0.7, longitudeDelta: 0.7
            )
        ), 
        animated: true)
    }
}
