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
    
    init() {
        let db = Firestore.firestore()
        db.collection("dua").getDocuments{ (snap, err) in
            if err != nil {
                print(err?.localizedDescription as Any)
                return
            }
            
            for dua in snap!.documentChanges {
                let id = dua.document.documentID
                let name = dua.document.get("name") as! String
                let category = dua.document.get("category") as! String
                let arabicDua = dua.document.get("arabic_dua") as! String
                let translation = dua.document.get("translation") as! String
                let transliteration = dua.document.get("transliteration") as! String
                
                self.duas.append(Dua(id: id, name: name, arabicDua: arabicDua, translation: translation, transliteration: transliteration, category: category))
            }
            print(self.duas)
        }
        
    }
}
