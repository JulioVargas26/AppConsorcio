//
//  EmpleadoViewController.swift
//  AppConsorcio
//
//  Created by DAMII on 19/11/23.
//

import UIKit
import FirebaseFirestore

class EmpleadoViewController: UIViewController,UITableViewDataSource,
                              UITableViewDelegate {
  
    @IBOutlet weak var tvEmpleado: UITableView!
    var listaEmpleado:[empleado]=[]
    var pos = -1
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tvEmpleado.dataSource=self
        //
        tvEmpleado.delegate=self
        //
        tvEmpleado.rowHeight=120
        
        listado()
    }
    
    func listado(){
        
        //acceder a la base de datos
        let bd=Firestore.firestore()
        
        //acceder a la coleccion para realizar recorrido
        bd.collection("empleado").addSnapshotListener{(data,error) in
            //validar el parametro data
            guard let info = data?.documents else{
                return
            }
            
            //guardar los datos en el arreglo
            self.listaEmpleado=info.map{(e)->empleado in
                
                //obtener valor de e
                let row=e.data()
                let nom=row["nombres"] as! String
                let apr=row["apellidos"] as! String
                let eda=row["edad"] as! Int
                
                return empleado(nombres: nom, apellidos: apr, edad: eda,id: e.documentID)
            }
            
            self.tvEmpleado.reloadData()
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaEmpleado.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row=tvEmpleado.dequeueReusableCell(withIdentifier: "item")
              as! ItemEmpleadoTableViewCell
        //imprimir datos
        row.lblNombres.text=listaEmpleado[indexPath.row].nombres
        row.lblApellidos.text=listaEmpleado[indexPath.row].apellidos
        return row
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        pos=indexPath.row
        performSegue(withIdentifier: "editar", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier=="editar"{
            //crear objeto de la clase EditarViewController
            let pantalla2=segue.destination as! EditarEmpleadoViewController
            //acceder
            pantalla2.bean=listaEmpleado[pos]
        }
        
    }
}
