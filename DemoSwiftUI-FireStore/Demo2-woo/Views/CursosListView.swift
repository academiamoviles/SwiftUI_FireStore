//
//  CursosListView.swift
//  Demo2-woo
//
//  Created by fredy asencios instructor on 5/9/20.
//  Copyright © 2020 Academia moviles. All rights reserved.
//

import SwiftUI

//let CursosTest = [
//Curso(nombre: "React", instructor: "Marc", horas: 24),
//Curso(nombre: "SwiftUI", instructor: "Arturo G", horas: 24)
//             ]
struct CursosListView: View {
//    var cursos = CursosTest
 @ObservedObject private  var viewModel = CursosViewModel()
    var body: some View {
        NavigationView{
            List(viewModel.cursos){ curso in
                VStack(alignment: .leading){
                    Text(curso.nombre)
                        .font(.title)
                    Text(curso.instructor)
                        .font(.headline)
                    Text("\(curso.horas) horas")
                        .font(.subheadline)
                }
            }
        }
        .navigationBarTitle("Cursos")
        .onAppear(){
            self.viewModel.fetchData()
        }
    }
}

struct CursosListView_Previews: PreviewProvider {
    static var previews: some View {
        CursosListView()
    }
}
