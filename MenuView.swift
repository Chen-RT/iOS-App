//
//  MenuView.swift
//  order (iOS)
//
//  Created by 陈润桐 on 2021/12/12.
//

import SwiftUI

struct MenuView: View {
    
    
    
    var body: some View {
            VStack {
                List {
                    NavigationLink(destination: classOne(index: 0)) {
                        Text("牛排")
                        Spacer()
                        Text("点击查看详情")
                    }
                    NavigationLink(destination: classOne(index: 1)) {
                        Text("布丁")
                        Spacer()
                        Text("点击查看详情")
                    }
                    NavigationLink(destination: classOne(index: 2)) {
                        Text("土豆")
                        Spacer()
                        Text("点击查看详情")
                    }
                }
                .navigationTitle("菜单")
            }
        
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MenuView()
        }
    }
}
