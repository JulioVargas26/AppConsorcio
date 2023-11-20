//
//  ControladorCliente.swift
//  AppConsorcio
//
//  Created by DAMII on 22/10/23.
//

import UIKit

class ControladorCliente: NSObject {

    //metodo para grabar
    func grabarCliente(bean:Cliente){
        //1.crear objeto de la clase AppDelegate
        let delegate=UIApplication.shared.delegate as! AppDelegate
        //2.acceder a la base de datos
        let BD=delegate.persistentContainer.viewContext
        //3.indicar tabla "entidad" a registrar
        let tabla=ClienteEntity(context: BD)
        //4. controlar exception
        do{
            //5.asignar valor a los atributos del objeto "tabla"
            tabla.codigo=Int16(bean.codigo)
            tabla.nombres=bean.nombres
            tabla.apellidos=bean.apellidos
            tabla.credito=bean.credito
            //6. grabar
            try BD.save()
        }catch let x as NSError{
            print(x.localizedDescription)
        }
        
    }
    //metodo para listar datos de la entidad ClienteEntity
    func datosClientes()->[ClienteEntity]{
        //1.declarar arreglo de tipo ClienteEntity
        var datos:[ClienteEntity]!
        //2.crear objeto de la clase AppDelegate
        let delegate=UIApplication.shared.delegate as! AppDelegate
        //3.acceder a la base de datos
        let BD=delegate.persistentContainer.viewContext
        //4. controlar exception
        do{
            //5.leer el contenido de la entidad ClienteEntity
            let registros=ClienteEntity.fetchRequest()
            //bucle
            datos=try BD.fetch(registros)
        }catch let x as NSError{
            print(x.localizedDescription)
        }
        return datos
    }
    func modificarCliente(bean:ClienteEntity){
        //1.crear objeto de la clase AppDelegate
        let delegate=UIApplication.shared.delegate as! AppDelegate
        //2.acceder a la base de datos
        let BD=delegate.persistentContainer.viewContext
        //3. controlar exception
        do{
            //4. grabar
            try BD.save()
        }catch let x as NSError{
            print(x.localizedDescription)
        }
    }
    func eliminarCliente(bean:ClienteEntity){
        //1.crear objeto de la clase AppDelegate
        let delegate=UIApplication.shared.delegate as! AppDelegate
        //2.acceder a la base de datos
        let BD=delegate.persistentContainer.viewContext
        //3. controlar exception
        do{
            //4.eliminar
            BD.delete(bean)
            //5. grabar
            try BD.save()
        }catch let x as NSError{
            print(x.localizedDescription)
        }
    }
    
}






