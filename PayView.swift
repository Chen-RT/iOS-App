//
//  PayView.swift
//  order (iOS)
//
//  Created by 陈润桐 on 2021/12/12.
//

import SwiftUI

struct PayView: View {
    
    @State var presentAlert: Bool = false
    @Binding var itemCount: [Int]
    
    var body: some View {
        VStack {
            
            Text("待支付金额").bold()
                .font(.system(size: 40))
                .padding()
            
            if itemCount[2] * 89 + itemCount[1] * 68 + itemCount[0] * 199 > 0 {
                Text("\(itemCount[2] * 89 + itemCount[1] * 68 + itemCount[0] * 199).00").bold()
                    .font(.system(size: 30))
            } else {
                Text("0.00").bold()
                    .font(.system(size: 30))
            }
            
            NavigationLink(destination: AdressView()) {
                HStack {
                    Text("选择地址")
                    Spacer()
                        .frame(width: 180)
                    Image(systemName: "chevron.right")
                }
            }.padding()
                .foregroundColor(.black)
            
            HStack {
                Button(action: {
                    presentAlert = true
                }) {
                    Image("zhifu-weixin")
                        .resizable()
                        .frame(width: 50, height: 50, alignment: .center)
                    Spacer()
                        .frame(width: 150)
                    Text("微信支付")
                }
                .alert(isPresented: $presentAlert) {
                    let alert = Alert(title: Text("支付成功"), message: Text("您已经成功支付"), primaryButton: .default(Text("确认")), secondaryButton: .destructive(Text("反馈")))
                    
                    return alert
                }
            }
            
            HStack {
                Button(action: {
                    presentAlert = true
                }) {
                    Image("zhifu-zhifubao")
                        .resizable()
                        .frame(width: 50, height: 50, alignment: .center)
                    Spacer()
                        .frame(width: 134)
                    Text("支付宝支付")
                }
            }
        }
        .navigationTitle("支付")
    }
}

//struct PayView_Previews: PreviewProvider {
//    static var previews: some View {
//        PayView()
//    }
//}
