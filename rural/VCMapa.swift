//
//  VCMapa.swift
//  rural
//
//  Created by JOAQUIN DIAZ RAMIREZ on 17/4/18.
//  Copyright © 2018 DAVID ANGULO CORCUERA. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class VCMapa: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    @IBOutlet var btnSalir:UIButton?
    @IBOutlet var mapa:MKMapView?
    var locationManager:CLLocationManager?
    var booleano = false;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestAlwaysAuthorization()
        locationManager?.startUpdatingLocation()
        mapa?.showsUserLocation = true
        
        for pueblo in DataHolder.sharedInstance.arPueblos {
                var coordTemp:CLLocationCoordinate2D = CLLocationCoordinate2D()
            coordTemp.latitude = pueblo.dlat!
            coordTemp.longitude = pueblo.dlon!
            agregarPin(coordenada: coordTemp, titulo: pueblo.sNombre! )
        }
        // Do any additional setup after loading the view.
        btnSalir?.layer.cornerRadius = 15
    }
    func agregarPin(coordenada:CLLocationCoordinate2D, titulo tpin:String)
    {
        let annotation:MKPointAnnotation = MKPointAnnotation()
        annotation.coordinate = coordenada
        annotation.title = tpin
        mapa?.addAnnotation(annotation)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    
        if(booleano == false){
            print("------>.", locations[0])
            let miSpan:MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
            let tempRegion:MKCoordinateRegion = MKCoordinateRegion(center: locations[0].coordinate, span: miSpan)
      
                mapa?.setRegion(tempRegion, animated: false)
                booleano = true
        }
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
