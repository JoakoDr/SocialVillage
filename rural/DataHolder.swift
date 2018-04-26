//
//  DataHolder.swift
//  rural
//
//  Created by MacMini on 9/4/18.
//  Copyright © 2018 DAVID ANGULO CORCUERA. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class DataHolder: NSObject {
    static let sharedInstance:DataHolder = DataHolder()
    var numeroCeldas:UInt=6;
    var firDataBasRef: DatabaseReference!
    //var arpueblos
    
    
    var firestoreDB:Firestore?
    var firStorage:Storage?
    var firStorageRef:StorageReference?
    var arCiudades:[pueblos] = []
    var arPueblos:[pueblos] = [] 
    var miPerfil:Perfil = Perfil ()
   
    func initFirebase() {
        FirebaseApp.configure()
        //var db = Firestore.firestore()
        firestoreDB=Firestore.firestore()
        firStorage = Storage.storage()
        firStorageRef = firStorage?.reference()
        //firDataBasRef = Database.database().reference()
    }
    func descargarColeccion(delegate:DataHolderDelegate) {
        //arCiudades;:[pueblos] = []
        var blFin:Bool = false
        DataHolder.sharedInstance.firestoreDB?.collection("pueblos").addSnapshotListener() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
                //blFin = false
                delegate.DHDdescargaCiudades!(blFin: false)
                
            } else {
                for document in querySnapshot!.documents {
                    let pueblo:pueblos = pueblos()
                    pueblo.sID=document.documentID
                    pueblo.setMap(valores: document.data())
                    self.arCiudades.append(pueblo)
                    print("\(document.documentID) => \(document.data())")
                    
                }
                //self.vcPrincipal?.refreshUI()
                
                //blFin=true
                delegate.DHDdescargaCiudades!(blFin: true)
            }
            
        }
        
    }
    
}

@objc protocol DataHolderDelegate
{
    @objc optional func DHDdescargaCiudades(blFin:Bool)
}
