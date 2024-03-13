//
//  DetallePlantaView.swift
//  HuertaShop
//
//  Created by Miguel  on 11/3/24.
//
import SwiftUI
import SDWebImageSwiftUI
struct DetalleProductoView: View {
    var producto: Producto

    var body: some View {
        VStack(alignment: .leading) {
            Text(producto.nombre).font(.headline)
            Text(producto.descripcion)
            Text("\(producto.precio)")
            
            // Aquí es donde se muestra la imagen.
            if let url = URL(string: producto.imagen) {
                WebImage(url: url)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } else {
                // Maneja el caso en que producto.imagen no es una URL válida.
                // Por ejemplo, podrías mostrar una imagen predeterminada.
            }
        }
        .padding()
        .navigationBarTitle(producto.nombre, displayMode: .inline)
    }
}
