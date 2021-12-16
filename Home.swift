//
//  Home.swift
//  order (iOS)
//
//  Created by 陈润桐 on 2021/12/8.
//

import SwiftUI

var curItem: Item = emptyList
var itemIndex: Int = 0

class Main: ObservableObject {
    @Published var items: [Item] = []
    
    func sort(){
    }
}

struct Home: View {
    var body: some View {
        Text("Hello, World!")
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
