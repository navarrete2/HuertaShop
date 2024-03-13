//
//  ProductoViewModel.swift
//  HuertaShop
//
//  Created by Miguel  on 10/3/24.
//

import Firebase

class ProductoViewModel: ObservableObject {
    @Published var productos = [Producto]()
    
    private var db = Firestore.firestore()
    
    func fetchProductos() {
        db.collection("Huerta").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            self.productos = documents.map { (queryDocumentSnapshot) -> Producto in
                let data = queryDocumentSnapshot.data()
                let id = queryDocumentSnapshot.documentID
                let nombre = data["nombre"] as? String ?? ""
                let descripcion = data["descripcion"] as? String ?? ""
                let precio = data["precio"] as? Double ?? 0.0
                let imagen = data["imagen"] as? String ?? ""
                
                return Producto(id: id, nombre: nombre, descripcion: descripcion, precio: precio, imagen: imagen)
            }
        }
    }
    
    func addProducto(nombre: String, descripcion: String, precio: Double, imagen: String) {
        print("addProducto se ha llamado con nombre: \(nombre), descripcion: \(descripcion), precio: \(precio), imagen: \(imagen)")
        
        var ref: DocumentReference? = nil
        ref = db.collection("Huerta").addDocument(data: [
            "nombre": nombre,
            "descripcion": descripcion,
            "precio": precio,
            "imagen": imagen
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added  con with ID: \(ref!.documentID)")
            }
        }
    }
}
