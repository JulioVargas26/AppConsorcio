//
//  Product.swift
//  AppConsorcio
//
//  Created by DAMII on 12/11/23.
//

import UIKit

struct Product:Codable {

    var id:Int
    var title:String
    var price:Double
    var description:String
    var category:String
    var image:String
    var rating:Rating
    
    
}
