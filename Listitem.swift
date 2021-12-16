//
//  Listitem.swift
//  order (iOS)
//
//  Created by 陈润桐 on 2021/12/8.
//

import SwiftUI

class Item: NSObject, NSCoding {
    func encode(with coder: NSCoder) {
        coder.encode(self.title, forKey: "title")
    }
    
    required init?(coder: NSCoder) {
        self.title = coder.decodeObject(forKey: "title") as? String ?? ""
    }
    
    var img_src: String = ""
    var title: String = ""
    init(title: String) {
        self.title = title
    }
}

var emptyList: Item = Item(title: "")

struct Listitem: View {
    @ObservedObject var main: Main
    
    var body: some View {
        HStack {
            Button(action: {
                curItem = self.main.
            })
        }
    }
}

struct Listitem_Previews: PreviewProvider {
    static var previews: some View {
        Listitem()
    }
}
