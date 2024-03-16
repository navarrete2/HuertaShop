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

    var precioFormateado: String {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
        return formatter.string(from: NSNumber(value: producto.precio)) ?? ""
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                if let url = URL(string: producto.imagen) {
                    WebImage(url: url)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 300)
                        .cornerRadius(10)
                        .shadow(radius: 10)
                } else {
                    // Maneja el caso en que producto.imagen no es una URL válida.
                    // Por ejemplo, podrías mostrar una imagen predeterminada.
                }
                
                Text(producto.nombre)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .padding(.top)
                Text(producto.descripcion)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .padding(.vertical)
                
                Text(precioFormateado)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
            }
            .padding()
        }
        .navigationBarTitle(producto.nombre, displayMode: .inline)
    }
}
