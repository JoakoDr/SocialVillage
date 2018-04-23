//
//  Perfil.swift
//  rural
//
//  Created by DAVID ANGULO CORCUERA on 12/4/18.
//  Copyright © 2018 DAVID ANGULO CORCUERA. All rights reserved.
//

import UIKit
// esta clase presenta el perfil del usuario actual descargandolo de la base de datos
class Perfil: NSObject {
    
    //hay que poner todos los datos del registro
    var sNombre:String?
    var sApellidos:String?
    var sAltura:Int?
    var sPueblo:String?
    // pasamos el hashmap descargado de la base de datos a las variables
    
    func setMap(valores:[String:Any]){
        sNombre = valores["Nombre"] as? String
        sApellidos = valores["Apellido"] as? String
        sAltura = valores["Altura"] as? Int
        sPueblo = valores["Pueblo"] as? String
    }
    // este metodo convierte a hashmap los datos para guardarlos en la base de datos
    func getMap() -> [String:Any] {
        
        return [
            "Nombre": sNombre as Any,
            "Apellido": sApellidos as Any,
            "Altura": sAltura as Any,
            "Pueblo": sPueblo as Any
        ]
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
