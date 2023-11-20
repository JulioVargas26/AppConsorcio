//
//  NuevoMedicamentoViewController.swift
//  AppConsorcio
//
//  Created by DAMII on 5/11/23.
//

import UIKit
import Alamofire

class NuevoMedicamentoViewController: UIViewController {

    @IBOutlet weak var txtCodigo: UITextField!
    @IBOutlet weak var txtNombre: UITextField!
    @IBOutlet weak var txtDescripcion: UITextField!
    @IBOutlet weak var txtStock: UITextField!
    @IBOutlet weak var txtPrecio: UITextField!
    @IBOutlet weak var txtFecha: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    func registrarMedicamento(obj: Medicamento){
        AF.request("https://puedeser.onrender.com/medicamento/registrar",method: .post,parameters: obj,encoder: JSONParameterEncoder.default).response(completionHandler: {
            data in
            //validar data
            switch data.result{
            case.success(let info):
                do{
                    let result = try JSONDecoder().decode(Medicamento.self, from: info!)
                }catch{
                    print("error en el Json")
                }
                
            case.failure(let error):
                print(error.localizedDescription)
            }
        })
    }
    
    @IBAction func btnRegistrar(_ sender: UIButton) {
        
        //leer cajas
        let cod=Int(txtCodigo.text ?? "0") ?? 0
        let nom=txtNombre.text ?? ""
        let des=txtDescripcion.text ?? ""
        let sto=Int(txtStock.text ?? "0") ?? 0
        let pre=Double(txtPrecio.text ?? "0") ?? 0
        let fec=txtFecha.text ?? ""
        
        //crear variable de la estructura Cliente
        let obj=Medicamento(codigo: cod, nombre: nom, descripcion: des, stock: sto, precio: pre, fecha: fec)
        //invocar al metodo grabarCliente
        registrarMedicamento(obj: obj)
        print("Registro correcto")
        
        
    }
    
    
    
}
