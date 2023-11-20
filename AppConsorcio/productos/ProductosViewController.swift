//
//  ProductosViewController.swift
//  AppConsorcio
//
//  Created by DAMII on 12/11/23.
//

import UIKit
import Alamofire
import Kingfisher

class ProductosViewController: UIViewController,
                               UICollectionViewDataSource,
                               UICollectionViewDelegate,
                               UICollectionViewDelegateFlowLayout
{
    
    @IBOutlet weak var cvProductos: UICollectionView!
    
    var listaProductos:[Product]=[]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        cvProductos.dataSource=self
        cvProductos.delegate=self
        cargarProductos()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listaProductos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let fila=collectionView.dequeueReusableCell(withReuseIdentifier: "row", for: indexPath) as! ItemProductosCollectionViewCell
        
        //imprimir datos en el collection
        fila.lblTitle.text=listaProductos[indexPath.row].title
        
        let url = URL(string: listaProductos[indexPath.row].image)
        fila.imgFoto.kf.setImage(with: url)
        
        return fila
    }
    
    func cargarProductos(){
        //conexion a la url del api
        AF.request("https://fakestoreapi.com/products").responseDecodable(of: [Product].self){
            
            response in guard let data=response.value else{return}
            self.listaProductos=data
            
            self.cvProductos.reloadData()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width=(collectionView.frame.width-20)/2
        
        return CGSize(width: width, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cod=listaProductos[indexPath.row].id
        
        print("id : ",cod)
    }

}
