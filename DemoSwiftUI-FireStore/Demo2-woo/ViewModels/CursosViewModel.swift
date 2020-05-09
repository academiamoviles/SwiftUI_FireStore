//
//  CursosViewModel.swift
//  Demo2-woo
//
//  Created by fredy asencios instructor on 5/9/20.
//  Copyright © 2020 Academia moviles. All rights reserved.
//

import Foundation
import FirebaseFirestore

class CursosViewModel:ObservableObject {
  @Published  var cursos = [Curso]()
    
    private var db = Firestore.firestore()
    
    func fetchData(){
        db.collection("cursos_academia").addSnapshotListener { (querySnapShot, error) in
            guard let cursosList = querySnapShot?.documents else {
                print("no documents")
                return
            }
            self.cursos = cursosList.map { (queryDocumentsSnapshot) -> Curso in
                let data = queryDocumentsSnapshot.data()
                let nombre = data["nombre"] as? String ?? ""
                let instructor = data["instructor"] as? String ?? ""
                let horas = data["horas"] as? Int ?? 0
                let curso = Curso(nombre: nombre, instructor: instructor, horas: horas)
                return curso
            }
        }
    }
}
