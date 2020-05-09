//
//  Curso.swift
//  Demo2-woo
//
//  Created by fredy asencios instructor on 5/8/20.
//  Copyright © 2020 Academia moviles. All rights reserved.
//

import Foundation

struct Curso:Identifiable {
    var id:String = UUID().uuidString
    var nombre:String
    var instructor:String
    var horas:Int
    
}
