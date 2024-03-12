//
//  ProductoView.swift
//  HuertaShop
//
//  Created by Miguel  on 10/3/24.
//
import SwiftUI
import SDWebImageSwiftUI
import FirebaseFirestore

struct ProductoView: View {
    let producto: Producto

    @State private var imageUrl: URL?

    var body: some View {
        VStack {
            Text(producto.nombre)
            Text(producto.descripcion)
            Text("\(producto.precio)")
            if let imageUrl = imageUrl {
                WebImage(url: imageUrl)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } else {
                Text("Cargando imagen...")
            }
        }
        .onAppear(perform: loadImage)
    }

    func loadImage() {
        let db = Firestore.firestore()

        db.collection("productos").document(producto.nombre).getDocument { (document, error) in
            if let document = document, document.exists {
                if let data = document.data(), let imageUrlString = data["imagen"] as? String, let imageUrl = URL(string: imageUrlString) {
                    self.imageUrl = imageUrl
                }
            } else {
                print("Document does not exist")
            }
        }
    }
}
