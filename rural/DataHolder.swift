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
    
    var arPueblos:[pueblos] = [] 
    var miPerfil:Perfil = Perfil ()
    func initFirebase() {
        FirebaseApp.configure()
        var db = Firestore.firestore()
        firestoreDB=Firestore.firestore()
        firStorage = Storage.storage()
        firDataBasRef = Database.database().reference()
    }
    
}
