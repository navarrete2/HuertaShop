//
//  ImageViewModel.swift
//  HuertaShop
//
//  Created by Miguel  on 11/3/24.
//

import Foundation
import Firebase

class ImageViewModel: ObservableObject {
    @Published var images = [ImageData]()

    private var db = Firestore.firestore()

    func fetchData() {
        db.collection("imagenes").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }

            self.images = documents.compactMap { queryDocumentSnapshot -> ImageData? in
                return try? queryDocumentSnapshot.data(as: ImageData.self)
            }
        }
    }
}
