//
//  ViewController.swift
//  daumMap
//
//  Created by 민경준 on 13/03/2019.
//  Copyright © 2019 민경준. All rights reserved.
//

import UIKit

class ViewController: UIViewController, MTMapViewDelegate {
    
    var mapView: MTMapView?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        mapView = MTMapView(frame: self.view.bounds)
        
        if let mapView = mapView {
            mapView.delegate = self
            mapView.baseMapType = .standard
            
            self.view.addSubview(mapView)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        var items = [MTMapPOIItem]()
        items.append(redPin(name: "집", latitude: 37.591676, longitude: 127.079267))
        items.append(redPin(name: "PC방", latitude: 37.593365, longitude: 127.074155))
        items.append(redPin(name: "편의점", latitude: 37.591993, longitude: 127.080020))
        //위 부분은 viewDidLoad()에서 수행해도 괜찮습니다
        
        mapView?.addPOIItems(items)
        mapView?.fitAreaToShowAllPOIItems()  // 모든 마커가 보이게 카메라 위치/줌 조정
    }
    
    func redPin(name: String, latitude: Double, longitude: Double) -> MTMapPOIItem {
        let item = MTMapPOIItem()
        item.itemName = name
        item.markerType = .redPin
        item.markerSelectedType = .redPin
        item.mapPoint = MTMapPoint(geoCoord: .init(latitude: latitude, longitude: longitude))
        item.showAnimationType = .noAnimation
        item.customImageAnchorPointOffset = .init(offsetX: 30, offsetY: 0)    // 마커 위치 조정
        
        return item
    }


}

