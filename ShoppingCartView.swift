//
//  ShoppingCartView.swift
//  order (iOS)
//
//  Created by 陈润桐 on 2021/12/9.
//

import SwiftUI

var itemIndex: Int = 0
var checked: Bool = false

class Main: ObservableObject {
    @Published var items: [menuItem] = []
    
    //    func sort(){
    //        self.items.sort(by: {$0.index < $1.index})
    //        for i in 0 ..< self.items.count {
    //            self.items[i].index = i
    //        }
    //    }
}

var emptyItem = [menuItem](repeating: menuItem(ifChecked: false, price: 0.0, name: ""), count: 3)

struct ShoppingCartView: View {
    
    @ObservedObject var main: Main
    @State var itemIndex: Int = 0
    @Binding var itemCount: [Int]
    @State var isPresent: Bool = false
    @State var editNumber: String = "0"
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    List {
                        HStack {
                            Text("商品").bold()
                            Spacer()
                            Text("数量").bold()
                            Spacer()
                            Text("价格").bold()
                        }
                        
                        if itemCount[0] != 0 && emptyItem[0].ifChecked == true {
                            HStack {
                                Text("牛排")
                                Spacer()
                                Text("\(itemCount[0])")
                                    .contextMenu(menuItems: {
                                        Button(action: {}){
                                            Text("修改数量")
                                            Image(systemName: "square.and.pencil")
                                        }
                                    })
                                                        
                                Spacer()
                                Text("\(itemCount[0] * 199)")
                            }
                        }
                        
                        if itemCount[1] != 0 && emptyItem[1].ifChecked == true {
                            HStack {
                                Text("布丁")
                                Spacer()
                                Text("\(itemCount[1])")
                                    .contextMenu(menuItems: {
                                        Button(action: {}){
                                            Text("修改数量")
                                            Image(systemName: "square.and.pencil")
                                        }
                                    })
                                Spacer()
                                Text("\(itemCount[1] * 68)")
                            }
                        }
                        
                        if itemCount[2] != 0 && emptyItem[2].ifChecked == true {
                            HStack {
                                Text("土豆")
                                Spacer()
                                Text("\(itemCount[2])")
                                    .contextMenu(menuItems: {
                                        Button(action: {}){
                                            Text("修改数量")
                                            Image(systemName: "square.and.pencil")
                                        }
                                    })
                                Spacer()
                                Text("\(itemCount[2] * 89)")
                            }
                        }
                        
                        HStack {
                            Text("        ")
                            Spacer()
                            Text("        ")
                            Spacer()
                            Text("总金额").bold()
                        }
                        
                        HStack {
                            Text("        ")
                            Spacer()
                            Text("        ")
                            Spacer()
                            Text("\((emptyItem[0].ifChecked ? itemCount[2] * 89 : 0) + (emptyItem[1].ifChecked ? itemCount[1] * 68 : 0) + (emptyItem[2].ifChecked ? itemCount[0] * 199 : 0)) 元")
                        }
                        
                    }
                    
                }
                .navigationTitle("购物车")
                
                HStack {
                    NavigationLink(destination: PayView(itemCount: $itemCount)) {
//                    NavigationLink(destination: PayView()) {

                        Text("去支付")
                            .padding()
                    }
                    
                    Spacer().frame(width: 150)
                    
                    Button(action: {
                        emptyItem[0].ifChecked = false
                        emptyItem[1].ifChecked = false
                        emptyItem[2].ifChecked = false
                        itemCount[0] = 0
                        itemCount[1] = 0
                        itemCount[2] = 0
                    }){
                        Image(systemName: "trash.slash")
                    }
                }
            }
        }
    }
    
}

//struct ShoppingCartView_Previews: PreviewProvider {
//    static var previews: some View {
////        ShoppingCartView(main: Main(), itemCount: $count)
//        classOne()
//    }
//}
