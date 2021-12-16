//
//  EditNumberView.swift
//  order (iOS)
//
//  Created by 陈润桐 on 2021/12/13.
//

import SwiftUI

struct EditNumberView: View {
    
    @Binding var itemCount: [Int]
    @Binding var editNumber: String
    
    var body: some View {
        VStack {
            TextField("输入数字...", text: $editNumber, onEditingChanged: { (value) in //设置text属性为username的值，$是指Binding wrapper绑定包装，表示可以修改属性的值
                print("onEditingChanged:\(self.editNumber)")
            }) {
                itemCount[0] = Int.init(editNumber)! //当用户完成文本框里的输入时，在控制台输出username属性的值
            }.textFieldStyle(RoundedBorderTextFieldStyle()) //设置TextField的样式为圆角边框样式
        }
    }
}

//struct EditNumberView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditNumberView()
//    }
//}
