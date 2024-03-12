//
//  AddDocument.swift
//  HuertaShop
//
//  Created by Miguel  on 11/3/24.
//

import Firebase

let db = Firestore.firestore()

func addData() {
    // Agregar un nuevo documento con un ID generado automáticamente
    db.collection("productos").addDocument(data: [
        "campo1": "valor1",
        "campo2": "valor2",
        "campo3": "valor3"
    ]) { err in
        if let err = err {
            print("Error al agregar el documento: \(err)")
        } else {
            print("Documento agregado con éxito")
        }
    }
}
