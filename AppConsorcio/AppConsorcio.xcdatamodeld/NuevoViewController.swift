//
//  NuevoViewController.swift
//  AppConsorcio
//
//  Created by DAMII on 22/10/23.
//

import UIKit

class NuevoViewController: UIViewController {

    @IBOutlet weak var txtCodigo: UITextField!
    @IBOutlet weak var txtNombres: UITextField!
    @IBOutlet weak var txtCredito: UITextField!
    @IBOutlet weak var txtApellidos: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func btnGrabar(_ sender: UIButton) {
        //leer cajas
        let codigo=Int(txtCodigo.text ?? "0") ?? 0
        let nom=txtNombres.text ?? ""
        let ape=txtApellidos.text ?? ""
        let cred=Double(txtCredito.text ?? "0") ?? 0
        //crear variable de la estructura Cliente
        let obj=Cliente(codigo: codigo, nombres: nom,
                        apellidos: ape, credito: cred)
        //invocar al metodo grabarCliente
        ControladorCliente().grabarCliente(bean: obj)
        print("Registro correcto")
    }
    
}
