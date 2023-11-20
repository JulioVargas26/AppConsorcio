//
//  ViewController.swift
//  AppConsorcio
//
//  Created by DAMII on 22/10/23.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,
      UITableViewDelegate{
    
    @IBOutlet weak var tvClientes: UITableView!
    //arreglo de la estructura cliente
    var listaClientes:[ClienteEntity]=[]
    //
    var pos = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        //listaClientes.append(Cliente(codigo: 1, nombres: "Luis",
        //                             apellidos: "Soto Aliaga", credito: 5200))
        listaClientes=ControladorCliente().datosClientes()
        tvClientes.dataSource=self
        //
        tvClientes.delegate=self
        //
        tvClientes.rowHeight=120
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaClientes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //crear objeto de la clase ItemTableViewCell invocando
        //a "celda"
        let row=tvClientes.dequeueReusableCell(withIdentifier: "celda")
              as! ItemTableViewCell
        //imprimir datos
        row.lblNombres.text=listaClientes[indexPath.row].nombres
        row.lblApellidos.text=listaClientes[indexPath.row].apellidos
        return row
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        pos=indexPath.row
        performSegue(withIdentifier: "editar1", sender: self)
    }
    
    
    @IBAction func btnNuevo(_ sender: UIButton) {
        performSegue(withIdentifier: "nuevo1", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier=="editar1"{
            //crear objeto de la clase EditarViewController
            let pantalla2=segue.destination as! EditarViewController
            //acceder
            pantalla2.data=listaClientes[pos]
        }
        
    }
    
    
}

