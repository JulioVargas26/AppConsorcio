//
//  EditarEmpleadoViewController.swift
//  AppConsorcio
//
//  Created by DAMII on 19/11/23.
//

import UIKit
import FirebaseFirestore

class EditarEmpleadoViewController: UIViewController {
    
    @IBOutlet weak var txtId: UITextField!
    @IBOutlet weak var txtNombres: UITextField!
    @IBOutlet weak var txtApellidos: UITextField!
    @IBOutlet weak var txtEdad: UITextField!
    var bean:empleado!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.txtId.isEnabled=false
        txtId.text=String(bean.id)
        txtNombres.text=bean.nombres
        txtApellidos.text=bean.apellidos
        txtEdad.text=String(bean.edad)
        
        
    }
    
    @IBAction func btnActualizar(_ sender: UIButton) {
        //leer cajas
        let nom=txtNombres.text ?? ""
        let ape=txtApellidos.text ?? ""
        let eda=Int(txtEdad.text ?? "0") ?? 0
        
        bean.nombres=nom
        bean.apellidos=ape
        bean.edad=eda
        
        actualizarEmpleado(x: bean)
    }
    
    func actualizarEmpleado(x:empleado){
        //acceder a la base de datos
        let bd=Firestore.firestore()
        
        //acceder a la coleccion "tabla"
        bd.collection("empleado").document(x.id).setData([
            "nombres":x.nombres,
            "apellidos":x.apellidos,
            "edad":x.edad
        ]){error in
            if let e=error{
                print(e.localizedDescription)
            }else{
                print("Actualizacion OK")
            }
        }
    }
    
    @IBAction func btnEliminar(_ sender: UIButton) {
        /*//crear ventana
         let ventana=UIAlertController(title: "Sistema", message: "Seguro de eliminar?", preferredStyle: .alert)
        //boton aceptar
        let botonAceptar=UIAlertAction(title: "Si", style: .default,handler: { [self]action in
            self.eliminarEmpleado(x: bean.id)
         })
        //adicionar boton aceptar
         ventana.addAction(botonAceptar)
        //adicionar boton cancelar
         ventana.addAction(UIAlertAction(title: "No", style: .cancel))
        //mostrar venta
        present(ventana, animated: true)*/
        
        
    }
    
    func eliminarEmpleado(x:empleado){
        //acceder a la base de datos
        let bd=Firestore.firestore()
        
        //acceder a la coleccion "tabla"
        bd.collection("empleado").document(x.id).delete(){error in
            if let e=error{
                print(e.localizedDescription)
            }else{
                print("Actualizacion OK")
            }
        }
    }
    
}

