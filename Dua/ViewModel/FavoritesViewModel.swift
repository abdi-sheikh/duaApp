//
//  FavoritesViewModel.swift
//  Dua
//
//  Created by Abdi Sheikh on 1/14/21.
//

import Foundation
import Firebase

class FavoritesViewModel: ObservableObject {
    
    @Published var duas =  [Dua]()
//    
//    init() {
//        let db = Firestore.firestore()
//        db.collection("favorites").addSnapshotListener{ (snap, err) in
//            guard let document = snap else {
//                print(err?.localizedDescription as Any)
//                return
//            }
//            
//            guard let data = document. else {
//              print("Document data was empty.")
//              return
//            }
//            print("Current data: \(data)")
//        }
//        
//    }
}
