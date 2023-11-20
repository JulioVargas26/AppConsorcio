//
//  EditarMedicamentoViewController.swift
//  AppConsorcio
//
//  Created by DAMII on 5/11/23.
//

import UIKit
import Alamofire

class EditarMedicamentoViewController: UIViewController {

    @IBOutlet weak var txtCodigo: UITextField!
    @IBOutlet weak var txtNombre: UITextField!
    @IBOutlet weak var txtDescripcon: UITextField!
    @IBOutlet weak var txtStock: UITextField!
    @IBOutlet weak var txtPrecio: UITextField!
    @IBOutlet weak var txtFecha: UITextField!
    
    var data:Medicamento!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        txtCodigo.text=String(data.codigo)
        txtNombre.text=data.nombre
        txtDescripcon.text=data.descripcion
        txtStock.text=String(data.stock)
        txtPrecio.text=String(data.precio)
        txtFecha.text=data.fecha
        
    }
    
    func actualizarMedicamento(obj: Medicamento){
        AF.request("https://puedeser.onrender.com/medicamento/actualizar",method: .put,parameters: obj,encoder: JSONParameterEncoder.default).response(completionHandler: {
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
  
    @IBAction func btnActualizar(_ sender: UIButton) {
        
        //leer cajas
        let nom=txtNombre.text ?? ""
        let des=txtDescripcon.text ?? ""
        let sto=Int(txtStock.text ?? "0") ?? 0
        let pre=Double(txtPrecio.text ?? "0") ?? 0
        let fec=txtFecha.text ?? ""
        
        data.nombre=nom
        data.descripcion=des
        data.stock=sto
        data.precio=pre
        data.fecha=fec
        
        actualizarMedicamento(obj: data)
        print("Registro actualizado")
    }
    
    
    func eliminarMedicamento(cod: Int){
        AF.request("https://puedeser.onrender.com/medicamento/eliminar/"+String(cod),method: .delete
        ).responseData{ data in
            //validar data
            switch data.result{
            case.success(let info):
                print("correcto")
            case .failure(let error):
                print(error)
            }
            
        }
        
    }
    
    @IBAction func btnEliminar(_ sender: UIButton) {
        //crear ventana
         let ventana=UIAlertController(title: "Sistema", message: "Seguro de eliminar?", preferredStyle: .alert)
        //boton aceptar
        let botonAceptar=UIAlertAction(title: "Si", style: .default,handler: { [self]action in
             self.eliminarMedicamento(cod: data.codigo)
         })
        //adicionar boton aceptar
         ventana.addAction(botonAceptar)
        //adicionar boton cancelar
         ventana.addAction(UIAlertAction(title: "No", style: .cancel))
        //mostrar venta
        present(ventana, animated: true)
    }
    
}
