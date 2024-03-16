//
//  BuscadorView.swift
//  HuertaShop
//
//  Created by Miguel  on 16/3/24.
//

import SwiftUI

struct BuscadorView: View {
    @EnvironmentObject var productoViewModel: ProductoViewModel

    var body: some View {
        NavigationView {
            VStack {
                TextField("Buscar...", text: $productoViewModel.textoDeBusqueda)
                    .padding()
                    .border(Color.gray, width: 0.5)
                    .onChange(of: productoViewModel.textoDeBusqueda) { _ in
                        // Aquí puedes realizar acciones adicionales cuando cambie el texto de búsqueda.
                        // Pero en este caso, no necesitas hacer nada porque la lista de productos se actualiza automáticamente.
                    }
                
                List(productoViewModel.productosFiltrados) { producto in
                    // Aquí puedes mostrar cada producto.
                    // Por ejemplo:
                    Text(producto.nombre)
                }
            }
            .navigationBarTitle("Buscador")
        }
    }
}
