import GoogleMaps
import UIKit
import GooglePlaces

class UserAccountViewController: UIViewController, GMSMapViewDelegate {
    
    var marker: GMSMarker?
    var mondattaView: UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Marker's Animation
        let opacityAnimation = CABasicAnimation(keyPath: "opacity")
        opacityAnimation.fromValue = 0.0
        opacityAnimation.toValue = 1.0
        opacityAnimation.duration = 0.5
        opacityAnimation.isRemovedOnCompletion = false
        opacityAnimation.fillMode = CAMediaTimingFillMode.forwards
        opacityAnimation.delegate = self as? CAAnimationDelegate
        
        
        // Create Marker`s Instance
        let camera = GMSCameraPosition.camera(withLatitude: 35.709026, longitude: 139.731993, zoom: 12.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        
        mapView.delegate = self
        
        mapView.isMyLocationEnabled = true // My Location
        
        let marker2 = GMSMarker()
        marker2.position = CLLocationCoordinate2D(latitude: 35.709026, longitude: 139.731993)
        marker2.title = "Mondatta"
        marker2.snippet = "Austara"
        marker2.opacity = 0.7
        marker2.isFlat = true
        marker2.map = mapView
        
        opacityAnimation.setValue(marker2.layer, forKey: "marker2_opacity1")
        marker2.layer.add(opacityAnimation, forKey: "marker2_opacity2")
        
        
        
    }
  

}
class Marker: UIViewController, GMSMapViewDelegate {
    
}
