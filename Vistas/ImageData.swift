//
//  ImageData.swift
//  HuertaShop
//
//  Created by Miguel  on 11/3/24.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct ImageData: Identifiable, Codable {
    @DocumentID var id: String?
    var url: String
}
