import UIKit
import GoogleMaps
import GooglePlaces

class MapViewController: UIViewController, UISearchBarDelegate, GMSMapViewDelegate{
    
    var searchBar: UISearchBar!
    var num: Int = 1
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSearchBar()
        
        let camera = GMSCameraPosition.camera(withLatitude: 35.68154, longitude: 139.752498, zoom: 13)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.isMyLocationEnabled = true
        self.view = mapView
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2DMake(35.68154,139.752498)
        marker.title = "The Imperial Palace"
        marker.snippet = "Tokyo"
        marker.map = mapView
    }
    
    override func loadView() {   // load View とはViewDidloadの前に呼び出される処理
        //有名スポットをmap上に表示、タップ可能
        let camera = GMSCameraPosition.camera(withLatitude:47.603,longitude:-122.331,zoom:14)
        let mapView = GMSMapView.map(withFrame: .zero, camera: camera)
        mapView.isMyLocationEnabled = true
        mapView.delegate = self
        self.view = mapView
        
        // 現在の位置情報を入手
        mapView.isMyLocationEnabled = true
        if let mylocation = mapView.myLocation {
            print("User's location: \(mylocation)")
        } else {
            print("User's location is unknown")
        }
        
    }
    
    func mapView(_ mapView:GMSMapView, didTapPOIWithPlaceID placeID:String,
                 name:String, location:CLLocationCoordinate2D) {
        print("You tapped \(name): \(placeID), \(location.latitude)/\(location.longitude)")
    }
    
    func setupSearchBar() { // searchBarの生成
        if let navigationBarFrame = navigationController?.navigationBar.bounds {
            let searchBar: UISearchBar = UISearchBar(frame: navigationBarFrame)
            searchBar.delegate = self
            searchBar.placeholder = "タイトルで探す"
            searchBar.tintColor = UIColor.gray
            searchBar.keyboardType = UIKeyboardType.default
            navigationItem.titleView = searchBar
            navigationItem.titleView?.frame = searchBar.frame
            self.searchBar = searchBar
        }
        
    }
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        searchBar.showsCancelButton = true
        return true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
        searchBar.resignFirstResponder()
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        loadShop(word: searchBar.text!)
    }
    
    func loadShop(word: String) { //この中にGooglePlacesAPI
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
}
