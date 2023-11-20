//
//  MedicamentoViewController.swift
//  AppConsorcio
//
//  Created by DAMII on 5/11/23.
//

import UIKit
import Alamofire

class MedicamentoViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    
    //tvMedicamentos ==> nombre de la tabla
    @IBOutlet weak var tvMedicamentos: UITableView!
    var listaMedicamentos:[Medicamento]=[]
    var pos = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        cargarMedicamentos()
        
        tvMedicamentos.delegate=self
        tvMedicamentos.dataSource=self
        tvMedicamentos.rowHeight=100
        
    }
    
    func cargarMedicamentos(){
        
        //conexion a la url del api
        AF.request("https://puedeser.onrender.com/medicamento/lista").responseDecodable(of: [Medicamento].self){
            
            response in guard let data=response.value else{return}
            self.listaMedicamentos=data
            
            self.tvMedicamentos.reloadData()
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaMedicamentos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row=tvMedicamentos.dequeueReusableCell(withIdentifier: "celda")
              as! ItemMedicamentoTableViewCell
        //imprimir datos
        row.lblMedicamento.text=listaMedicamentos[indexPath.row].nombre
        row.lblStock.text=String(listaMedicamentos[indexPath.row].stock)
        row.lblPrecio.text=String(listaMedicamentos[indexPath.row].precio)
        return row
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        pos=indexPath.row
        performSegue(withIdentifier: "editar", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier=="editar"{
            //crear objeto de la clase EditarViewController
            let pantalla2=segue.destination as! EditarMedicamentoViewController
            //acceder
            pantalla2.data=listaMedicamentos[pos]
        }
        
    }

}
