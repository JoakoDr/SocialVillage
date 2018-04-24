//
//  VCRegister.swift
//  rural
//
//  Created by DAVID ANGULO CORCUERA on 3/4/18.
//  Copyright © 2018 DAVID ANGULO CORCUERA. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
class VCRegister: UIViewController {
    // e-mail
    @IBOutlet var txtEmail:NuevoTextField?

    // contraseña introducida de nuevo
    @IBOutlet var txtPassword2:NuevoTextField?
    // usuario(tiene que ser un email)
    @IBOutlet var txtUser:NuevoTextField?
    //contraseña
    @IBOutlet var txtPassword:NuevoTextField?
    //boton de continuar
    @IBOutlet var btnRegistro:UIButton?
    //boton de volver
    @IBOutlet var btnVolver:UIButton?
    // variable que almacena la fecha
    @IBOutlet var fecha:UIDatePicker?
    // variable que mostrara el texto de que las contraseñas no coinciden
    @IBOutlet var testPassword:UILabel?
   
    
    @IBAction func eventoClickLogin()  {
        
        DataHolder.sharedInstance.miPerfil.sNombre="Nombre"
        DataHolder.sharedInstance.miPerfil.sAltura = 189
        DataHolder.sharedInstance.miPerfil.sApellidos="Diaz"
        DataHolder.sharedInstance.miPerfil.sPueblo="Tarancon"//.miPerfil.sNombre = "nombre"
        // if que comprueba que no queen campos vacios
        if !((txtUser?.text?.isEmpty)! || (txtPassword?.text?.isEmpty)! || (txtPassword2?.text?.isEmpty)! || (txtEmail?.text?.isEmpty)!) {
            // if que comprueba que ambas contraseñas y e-mails coincidan
            if(txtPassword?.text == txtPassword2?.text){
                // creamos el usuario
                Auth.auth().createUser(withEmail: (txtEmail?.text)!, password: (txtPassword?.text)!){ (user, error) in
                    // comprobamos que el usuario se ha registrado
                    if (user != nil) {
                        print("Te Registraste !")
                         DataHolder.sharedInstance.firestoreDB?.collection("perfiles").document((user?.uid)!).setData(DataHolder.sharedInstance.miPerfil.getMap()) { err in
                            if let err = err {
                                print("Error adding document: \(err)")
                            } else {
                                print("Document added with ID:")
                            }
                        }

                        self.performSegue(withIdentifier: "transicionregistro", sender: self)
                    }else
                    {
                        print(error!)
                
                    }
                }
                
                
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Redondeamos los botones al cargar la app
        btnVolver?.layer.cornerRadius = 15
        btnRegistro?.layer.cornerRadius = 15
        fecha?.layer.cornerRadius = 15
   
        // Do any additional setup after loading the view.
    }

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

}
