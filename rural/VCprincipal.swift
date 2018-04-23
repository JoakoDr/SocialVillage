//
//  VCprincipal.swift
//  rural
//
//  Created by DAVID ANGULO CORCUERA on 5/4/18.
//  Copyright © 2018 DAVID ANGULO CORCUERA. All rights reserved.
//

import UIKit

class VCprincipal: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    @IBOutlet var coleccion: UICollectionView?
    @IBOutlet var btnsalir:UIButton?
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return self.arCiudades.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:CVcolection = collectionView.dequeueReusableCell(withReuseIdentifier: "idcelda2", for: indexPath) as! CVcolection
        cell.lblNombre?.text = arCiudades[indexPath.row].sNombre
        cell.mostrarImagen(url: DataHolder.sharedInstance.arPueblos[indexPath.row].sImagen!)
        return cell
    
    }
    var arCiudades:[pueblos] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        DataHolder.sharedInstance.firestoreDB?.collection("pueblos").addSnapshotListener() { (querySnapshot, err) in
        if let err = err {
            print("Error getting documents: \(err)")
        } else {
            for document in querySnapshot!.documents {
                let pueblo:pueblos = pueblos()
                pueblo.sID=document.documentID
                pueblo.setMap(valores: document.data())
                self.arCiudades.append(pueblo)
                print("\(document.documentID) => \(document.data())")
            }
            self.refreshUI()
        }
        
    }
    }
        // Do any additional setup after loading the view.
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

        func refreshUI () {
            DispatchQueue.main.async(execute:{self.coleccion?.reloadData()})
        }
    }

