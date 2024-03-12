//
//  ListaProductosView.swift
//  HuertaShop
//
//  Created by Miguel  on 10/3/24.
//
import SwiftUI
struct ListaProductosView: View {
    @ObservedObject var viewModel: ProductoViewModel

    var body: some View {
        List(viewModel.productos) { producto in
            ProductoView(producto: producto)
        }
        .onAppear {
            viewModel.fetchProductos()
        }
    }
}
