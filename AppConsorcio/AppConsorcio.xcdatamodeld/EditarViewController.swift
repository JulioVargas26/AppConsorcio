//
//  EditarViewController.swift
//  AppConsorcio
//
//  Created by DAMII on 22/10/23.
//

import UIKit

class EditarViewController: UIViewController {

    @IBOutlet weak var txtCodigo: UITextField!
    @IBOutlet weak var txtNombres: UITextField!
    @IBOutlet weak var txtApellidos: UITextField!
    @IBOutlet weak var txtCredito: UITextField!
    //declarar objeto de tipo ClienteEntity
    var data:ClienteEntity!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtCodigo.text=String(data.codigo)
        txtNombres.text=data.nombres
        txtApellidos.text=data.apellidos
        txtCredito.text=String(data.credito)
    }
    

    @IBAction func btnActualizar(_ sender: UIButton) {
        //leer cajas
        let nom=txtNombres.text ?? ""
        let ape=txtApellidos.text ?? ""
        let cred=Double(txtCredito.text ?? "0") ?? 0
        //
        data.nombres=nom
        data.apellidos=ape
        data.credito=cred
        //invocar al metodo modificarCliente
        ControladorCliente().modificarCliente(bean: data)
        print("Registro actualizado")
    }
    
    @IBAction func btnEliminar(_ sender: UIButton) {
       //crear ventana
        let ventana=UIAlertController(title: "Sistema", message: "Seguro de eliminar?", preferredStyle: .alert)
       //boton aceptar
        let botonAceptar=UIAlertAction(title: "Si", style: .default,handler: {action in
            ControladorCliente().eliminarCliente(bean: self.data)
        })
       //adicionar boton aceptar
        ventana.addAction(botonAceptar)
       //adicionar boton cancelar
        ventana.addAction(UIAlertAction(title: "No", style: .cancel))
       //mostrar venta
       present(ventana, animated: true)
    }
    
}
