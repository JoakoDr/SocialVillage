//
//  ViewController.swift
//  rural
//
//  Created by DAVID ANGULO CORCUERA on 22/3/18.
//  Copyright © 2018 DAVID ANGULO CORCUERA. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class ViewController: UIViewController {
     @IBOutlet var txtUser:UITextField?
     @IBOutlet var txtPassword:UITextField?
     @IBOutlet var btnLogin:UIButton?
     @IBOutlet var btnregistro:UIButton?
    
    
   @IBAction func eventoClickLogin()  {
    Auth.auth().signIn(withEmail: (txtUser?.text)!, password: (txtPassword?.text)!) { (user, error) in
        if (user != nil) {
            let refperfiles = DataHolder.sharedInstance.firestoreDB?.collection("perfiles").document((user?.uid)!)
            refperfiles?.getDocument { (document, error) in
                if document != nil {
                    DataHolder.sharedInstance.miPerfil.setMap(valores: (document?.data())!)
                    print(document?.data()! as Any)
                } else {
                    print("Document does not exist")
                }
            }
            print("Te Registraste !"+(user?.uid)!)
            self.performSegue(withIdentifier: "transicionlogin", sender: self)
        }else
        {
            print(error!)
            
        }
    }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        btnLogin?.layer.cornerRadius = 10
         btnregistro?.layer.cornerRadius = 10
        Auth.auth().addStateDidChangeListener { (auth, user) in
            if(user != nil){
                self.performSegue(withIdentifier: "transicionlogin", sender: self)
            }
        }
       //txtUser?.text = DataHolder.sharedInstance.miNombre
       // print("  "+DataHolder.sharedInstance.miNombre)
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

