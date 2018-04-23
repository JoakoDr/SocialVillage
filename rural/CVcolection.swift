//
//  CVcolection.swift
//  rural
//
//  Created by DAVID ANGULO CORCUERA on 5/4/18.
//  Copyright © 2018 DAVID ANGULO CORCUERA. All rights reserved.
//

import UIKit

class CVcolection: UICollectionViewCell {
    @IBOutlet var imagen:UIImageView?
    @IBOutlet var lblNombre:UILabel?
    @IBOutlet var btnSalir:UIButton?
    
    var imagenDescargada:UIImage?
    func mostrarImagen(url:String) {
        self.imagen?.image = nil
        // if imagenDescargada == nil {
        let gsReference = DataHolder.sharedInstance.firStorage?.reference(forURL: url)//.sharedInstance.FirStorage.reference(forURL:url)
        
        // Download in memory with a maximum allowed size of 1MB (1 * 1024 * 1024 bytes)
        gsReference?.getData(maxSize: 1 * 1024 * 1024) { data, error in
            if let error = error {
                // Uh-oh, an error occurred!
            } else {
                // Data for "images/island.jpg" is returned
                //let image = UIImage(data: data!)
                self.imagenDescargada = UIImage(data: data!)
                self.imagen?.image = self.imagenDescargada
            }
        }
        //}
        btnSalir?.layer.cornerRadius = 15
    }
}
