# SwiftUI_FireStore
Ejemplo que es parte del curso SwiftUI que se dicta en Academia Móviles

# Paso 1:
Crear Proyecto en Xcode, el ejemplo incluye proyecto UIKit en la primera vista y con un botón , presenta la vista SwiftUI , está comentado el código en caso se desee usar navigation controlar (UIKit).

@IBAction func pasarToSwiftUI(_ sender: Any) {
        let cursosList = CursosListView()
        let host = UIHostingController(rootView: cursosList)
//        self.navigationController?.pushViewController(host, animated: true)
        self.present(host, animated: true, completion: nil)
    }

# Paso2:
crear el modelo de curso, 

MODELO Curso:
struct Curso:Identifiable {
    var id:String = UUID().uuidString
    var nombre:String
    var instructor:String
    var horas:Int
    
}

# Paso3:
Crear el ViewModel (CursoViewModel.sqft), aquí se puede apreciar en la función fetchData el manejo de datos remotos desde la colección cursos_academia en FireStore.

También se define la class como observable, y la variable a observar.

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





# Paso4: 
Se puede visualizar el código de la vista con SwiftUI 

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



# Paso5: 
Para realizar los pasos del 1 al 4, se requiere instalar Firebase/FireStore desde la libreria google  FireBase :

https://firebase.google.com/?hl=es-419&gclid=CjwKCAjwqdn1BRBREiwAEbZcRyLZGdbHIzBisXq0jjply_y21JNdq1LacpFw4ejP4rn2I469UWHp0RoCtPgQAvD_BwE

Y configurar el FireStore :
https://firebase.google.com/docs/firestore/quickstart

Creditos: inspirado en post del canal de Youtube FireBase : "SwiftUI: Fetching data from Firestore in real-time | Firebase Semi-live"

https://www.youtube.com/watch?v=f6u3AnOKZd0&feature=em-uploademail

