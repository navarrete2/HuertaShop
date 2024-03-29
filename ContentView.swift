//
//  ContentView.swift
//  HuertaShop
//
//  Created by Miguel  on 10/3/24.
//import SwiftUI
import SwiftUI
import SDWebImageSwiftUI
import FirebaseAnalytics
import FirebaseAppCheck

struct ContentView: View {
    @ObservedObject var productoViewModel = ProductoViewModel()

    var body: some View {
        TabView {
            NavigationView {
                ScrollView {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 200))]) {
                        ForEach(productoViewModel.productos) { producto in
                            NavigationLink(destination: DetalleProductoView(producto: producto)) {
                                ProductoCardView(producto: producto)
                            }
                        }
                    }
                    .padding()
                }
                .onAppear() {
                    self.productoViewModel.fetchProductos()
                    let isAppCheckEnabled = AppCheck.appCheck().isTokenAutoRefreshEnabled
                    print("Firebase App Check está habilitado: \(isAppCheckEnabled)")
                }
                .navigationBarTitle("Productos de la Huerta", displayMode: .inline)
            }
            .tabItem {
                Label("Productos", systemImage: "leaf.arrow.circlepath")
            }
            
            // Tab de Perfil
            Text("Perfil")
                .tabItem {
                    Label("Perfil", systemImage: "person.circle")
                }

            // Tab de Buscador
            BuscadorView()
                .tabItem {
                    Label("Buscador", systemImage: "magnifyingglass")
                }

            // Tab de Categorías
            Text("Categorías")
                .tabItem {
                    Label("Categorías", systemImage: "square.grid.2x2")
                }
        }
    }
}

struct ProductoCardView: View {
    var producto: Producto

    func formatearPrecio(_ precio: Double) -> String {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
        return formatter.string(from: NSNumber(value: precio)) ?? ""
    }

    var body: some View {
        VStack(alignment: .leading) {
            if let url = URL(string: producto.imagen) {
                WebImage(url: url)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 150)
                    .cornerRadius(10)
                    .shadow(radius: 10)
            } else {
                // Maneja el caso en que producto.imagen no es una URL válida.
                // Por ejemplo, podrías mostrar una imagen predeterminada.
            }
            
            Text(producto.nombre)
                .font(.headline)
                .foregroundColor(.primary)
            Text(producto.descripcion)
                .font(.subheadline)
                .foregroundColor(.secondary)
            Text(formatearPrecio(producto.precio))
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.primary)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 10)
    }
}
