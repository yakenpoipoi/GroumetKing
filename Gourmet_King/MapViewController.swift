// 自分の位置情報が出せない
// 検索バーに入力したワードを読み込めない
import UIKit
import GoogleMaps
import GooglePlaces

import Alamofire
import SwiftyJSON

class MapViewController: UIViewController, UISearchBarDelegate, GMSMapViewDelegate{
    
    var searchBar: UISearchBar!
    var searchResults: [String]!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSearchBar()
        
        let camera = GMSCameraPosition.camera(withLatitude: 35.68154, longitude: 139.752498, zoom: 13)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        
        mapView.isMyLocationEnabled = true  //現在地の位置情報を取得
        mapView.settings.myLocationButton = true // 現在地の位置情報を表示
        
        let marker = GMSMarker()  //開いた画面の表示の中心のピンの情報
        marker.position = CLLocationCoordinate2DMake(35.68154,139.752498)
        marker.title = "The Imperial Palace"
        marker.snippet = "Tokyo"
        marker.map = mapView
    }
    
//    func mapView(_ mapView:GMSMapView, didTapPOIWithPlaceID placeID:String, name:String, location:CLLocationCoordinate2D) {
//        print("You tapped \(name): \(placeID), \(location.latitude)/\(location.longitude)")
//    }      ???????
    
    func setupSearchBar() { // searchBarの生成
        
        if let navigationBarFrame = navigationController?.navigationBar.bounds {
            let searchBar: UISearchBar = UISearchBar(frame: navigationBarFrame)
            searchBar.delegate = self   // delegateの指定
            searchBar.placeholder = "タイトルで探す"
            searchBar.tintColor = UIColor.gray
            searchBar.keyboardType = UIKeyboardType.default
            navigationItem.titleView = searchBar
            navigationItem.titleView?.frame = searchBar.frame
            self.searchBar = searchBar
        }
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        self.view.endEditing(true)
    //  searchBar.showsCancelButton = true
    //  self.searchResults = PPAP.filter{
    //  大文字と小文字を区別せずに検索
    //  $0.lowercased().contains(searchBar.text!.lowercased())
    //        }
    //  self.tableView.reloadData()
        
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
    
    
    
    
    func loadShop(word: String) {  //この中にGooglePlacesAPI
        
        let wordncoded = word.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!  // エンコード
        let urlText = "https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=\(wordncoded)&inputtype=textquery&fields=name,photos,rating,id,geometry&key=AIzaSyCzxGY3_c1f2CONYPrQXEk3OzErXbMGv2c"

        Alamofire.request(urlText).responseJSON { response in
            
            guard let object = response.result.value else {
                return
            }
            
            let json = JSON(object)
            
            print(json)
            
//            json.forEach { (_, json) in
            
                print(json)
                
                print(json[0]["geometry"]["location"]["lat"])  // latitudeは取り出せた
                
                let longitude = (json[0]["geometry"]["location"]["lat"].string! as NSString).doubleValue
                let latitude = (json[0]["geometry"]["location"]["lng"].string! as NSString).doubleValue
                
                let camera = GMSCameraPosition.camera(withLatitude: latitude, longitude: longitude, zoom: 13)
                let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
                self.view = mapView
                
                let marker = GMSMarker()  //開いた画面の表示の中心のピンの情報
                marker.position = CLLocationCoordinate2DMake(latitude, longitude)
                marker.title = "The Imperial Palace"
                marker.snippet = "Tokyo"
                marker.map = mapView
            

//            }
        }
    }
    
}

extension MapViewController: GMSAutocompleteViewControllerDelegate {
    
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {

        print(place)
        print("Place name: \(String(describing: place.name))")
        print("Place address: \(String(describing: place.formattedAddress))")
        print("Place attributions: \(String(describing: place.attributions))")
        dismiss(animated: true, completion: nil)
    }
    
    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
        print("Error: \(error)")
        dismiss(animated: true, completion: nil)
    }
    
    // User cancelled the operation.
    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        print("Autocomplete was cancelled.")
        dismiss(animated: true, completion: nil)
    }
}
