//
//  NuevoEmpleadoViewController.swift
//  AppConsorcio
//
//  Created by DAMII on 19/11/23.
//

import UIKit
import FirebaseFirestore

class NuevoEmpleadoViewController: UIViewController {

    @IBOutlet weak var txtNombres: UITextField!
    @IBOutlet weak var txtApellidos: UITextField!
    @IBOutlet weak var txtEdad: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnGrabar(_ sender: UIButton) {
       
        
        let nom=txtNombres.text ?? ""
        let ape=txtApellidos.text ?? ""
        let eda=Int(txtEdad.text ?? "0") ?? 0
        
        let obj=empleado(nombres: nom, apellidos: ape, edad: eda, id: "")
        
        registrarEmpleado(bean: obj)
        
    }
    
    
    func registrarEmpleado(bean:empleado){
        //acceder a la base de datos
        let bd=Firestore.firestore()
        
        //generar el id
        let id=UUID().uuidString
        
        //acceder a la coleccion "tabla"
        bd.collection("empleado").document(id).setData([
            "nombres":bean.nombres,
            "apellidos":bean.apellidos,
            "edad":bean.edad
        ]){error in
            if let e=error{
                print(e.localizedDescription)
            }else{
                print("Registro OK")
            }
        }
    }
    
    
    
    
    
}
