//
//  DuaController.swift
//  Dua
//
//  Created by Abdi Sheikh on 1/1/21.
//

import Foundation
import Firebase

class DuaViewModel: ObservableObject {
    
    @Published var duas =  [Dua]()
    let db = Firestore.firestore()
    
    init() {
        load()
    }
    
    func duaById(_ id: String) -> Dua? {
        return duas.first { dua in
            dua.id == id
        }
    }
    
    func load() {
        db.collection("dua").getDocuments{ [weak self] (snap, err) in
            if err != nil {
                print(err?.localizedDescription as Any)
                return
            }
            
            /// TODO: Decode document w/o force unwrap. use result, decodeable and try/catch.
            for dua in snap!.documentChanges {
                let id = dua.document.documentID
                let name = dua.document.get("name") as! String
                let category = dua.document.get("category") as! String
                let arabicDua = dua.document.get("arabic_dua") as! String
                let translation = dua.document.get("translation") as! String
                let transliteration = dua.document.get("transliteration") as! String
                
                self?.duas.append(Dua(id: id, name: name, arabicDua: arabicDua, translation: translation, transliteration: transliteration, category: category))
            }
        }
    }
}


