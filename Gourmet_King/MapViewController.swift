//
//  MapViewController.swift
//  Gourmet_King
//
//  Created by Yoshiki Kishimoto on 2019/03/02.
//  Copyright © 2019 Yoshiki Kishimoto. All rights reserved.
//

import UIKit
import MapKit


class TestMKPointAnnotation: MKPointAnnotation {
    //ピンの色
    var pinColor: UIColor!
    //ピンの画像
    var pinImage: String!
}

class MapViewController: UIViewController, MKMapViewDelegate, UISearchBarDelegate  {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet var MapView: MKMapView!
    
    var testManager:CLLocationManager = CLLocationManager() //位置情報の取得
    
    var num: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        if num == 1 {
            //緯度、経度を指定
            let coordinate = CLLocationCoordinate2DMake(35.7090259, 139.7319925)//緯度経度を指定
            let span = MKCoordinateSpan(latitudeDelta: 0.1,longitudeDelta: 0.1)//範囲を指定
            let region = MKCoordinateRegion(center: coordinate, span: span)
            MapView.setRegion(region, animated:true)
            
        }
        

    }
    //検索ボタン押下時の呼び出しメソッド
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        
        //キーボードを閉じる。
        searchBar.resignFirstResponder()
        
        //検索条件を作成する。
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = searchBar.text
        
        //検索範囲はマップビューと同じにする。
        request.region = MapView.region
        
        //ローカル検索を実行する。
        let localSearch:MKLocalSearch = MKLocalSearch(request: request)
        localSearch.start(completionHandler: {(result, error) in
            
            for placemark in (result?.mapItems)! {
                if(error == nil) {
                    
                    //検索された場所にピンを刺す。
                    let annotation = MKPointAnnotation()
                    annotation.coordinate = CLLocationCoordinate2DMake(placemark.placemark.coordinate.latitude, placemark.placemark.coordinate.longitude)
                    annotation.title = placemark.placemark.name
                    annotation.subtitle = placemark.placemark.title
                    self.MapView.addAnnotation(annotation)
                    
                } else {
                    //エラー
                    print(error)
                }
            }
        })
    }
    



}
