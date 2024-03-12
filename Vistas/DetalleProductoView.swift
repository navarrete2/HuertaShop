//
//  DetallePlantaView.swift
//  HuertaShop
//
//  Created by Miguel  on 11/3/24.
//
import SwiftUI
import SDWebImageSwiftUI

struct DetalleProductoView: View {
    let producto: Producto

    var body: some View {
        VStack {
            Text(producto.nombre)
            Text(producto.descripcion)
            Text("\(producto.precio)")
            if let url = URL(string: producto.imagen) {
                WebImage(url: url)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } else {
                Text("Cargando imagen...")
            }
            Button(action: {
                // Aquí puedes poner el código para abrir WhatsApp
                if let url = URL(string: "whatsapp://send?phone=+34644444647&text=Hola"), UIApplication.shared.canOpenURL(url) {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                } else {
                    // Mostrar un mensaje de error al usuario
                    print("No se pudo abrir WhatsApp")
                }
            }) {
                Image(systemName: "message")
            }
        }
    }
}
