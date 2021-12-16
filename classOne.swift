//
//  classOne.swift
//  order (iOS)
//
//  Created by 陈润桐 on 2021/12/8.
//

import SwiftUI

struct classOne: View {
    
    @State var index = 0
    @State var checked = 0
    @State var open  = false
    @State var count: [Int] = [0, 0, 0]
    
    var body: some View {
        
        VStack {
            VStack {
                HStack {
                    Spacer()
                        .frame(height: 30)
                }
                .padding([.horizontal, .top])
                
                HStack(spacing: 15) {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("菜品")
                            .font(.system(size: 20))
                            .foregroundColor(Color.black)
                            .fontWeight(.bold)
                        Text(index == 0 ? "牛排" : index == 1 ? "布丁" : "土豆")
                            .foregroundColor(Color.black)
                        
                        Text("月销量")
                            .fontWeight(.bold)
                            .font(.system(size: 20))
                            .foregroundColor(Color.black)
                            .padding(.top,10)
                        Text(index == 0 ? "300" : index == 1 ? "12" : "50")
                            .foregroundColor(Color.black)
                        
                        Text("推荐")
                            .fontWeight(.bold)
                            .font(.system(size: 20))
                            .foregroundColor(Color.black)
                            .padding(.top,10)
                        Text(index == 0 ? "99 %" : index == 1 ? "98 %" : "90 %")
                            .foregroundColor(Color.black)
                        
                        Text("选择")
                            .fontWeight(.bold)
                            .font(.system(size: 20))
                            .foregroundColor(Color.black)
                            .padding(.top,10)
                        
                        HStack(spacing: 15) {
                            Button(action: {
                                
                                index = 0
                                
                            }) {
                                VStack {
                                    Circle()
                                        .fill(Color.yellow)
                                        .frame(width: index == 0 ? 30 : 20, height: index == 0 ? 30 : 20)
                                    Text("牛排")
                                        .foregroundColor(.black)
                                }
                            }
                            
                            Button(action: {
                                
                                index = 1
                                
                            }) {
                                VStack {
                                    Circle()
                                        .fill(Color.green)
                                        .frame(width: index == 1 ? 30 : 20, height: index == 1 ? 30 : 20)
                                    
                                    Text("布丁")
                                        .foregroundColor(.black)
                                }
                            }
                            
                            Button(action: {
                                
                                index = 2
                                
                            }) {
                                VStack {
                                    Circle()
                                        .fill(Color.orange)
                                        .frame(width: index == 2 ? 30 : 20, height: index == 2 ? 30 : 20)
                                    
                                    Text("土豆")
                                        .foregroundColor(.black)
                                }
                                
                            }
                        }
                        .padding(.top)
                    }
                    
                    Spacer(minLength: 0)
                    
                    Image(index == 0 ? "niupai的副本" : (index == 1 ? "buding" : "malingshu"))
                        .resizable()
                        .frame(width: 170, height: 108, alignment: .center)
                        .aspectRatio(contentMode: .fit)
                        .padding(.leading)
                }
                .padding()
            }
            .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
            .padding(.bottom, 25)
            .background(Color(red: 255 / 255, green: 228 / 255, blue: 225 / 255))
            .clipShape(CHShape())
            
            HStack(spacing: 20) {
                Text(index == 0 ? "牛排" : index == 1 ? "布丁" : "土豆")
                    .font(.system(size: 35))
                    .fontWeight(.black)
                
                Spacer()
                    .frame(width: 90)
                Text(index == 0 ? "$ 299" : index == 1 ? "$ 88" : "$ 109")
                    .font(.system(size: 20))
                    .foregroundColor(.red)
                    .overlay(
                        Rectangle()
                            .fill(Color.red)
                            .frame(height: 2)
                    )
                Text(index == 0 ? "$ 199" : index == 1 ? "$ 68" : "$ 89")
                    .font(.system(size: 25))
                    .frame(height: 2)
            }
            .padding()
            
            Spacer()
                .frame(height: 100)
            
            HStack {
                Button(action: {
                    if count[index] > 0 {
                        count[index] -= 1
                    }
                }){
                    Image(systemName: "minus.circle")
                }
                .foregroundColor(.orange)
                
                Text("\(count[index])")
                    .padding()
                    .frame(width: 65, alignment: .center)
                
                Button(action: {
                    count[index] += 1
                    print(count)
                }){
                    Image(systemName: "plus.circle")
                }
                .foregroundColor(.orange)
                
                Button(action: {
                    if count[index] > 0 {
                        if emptyItem[index].ifChecked == false {
                            emptyItem[index].ifChecked = true
                            emptyItem[index].count_cart = count[index]
                            emptyItem[index].name = index == 0 ? "牛排" : index == 1 ? "布丁" : "土豆"
                        } else {
                            emptyItem[index].count_cart += count[index]
                        }
                    }
                }) {
                    Image(systemName: "cart.badge.plus")
                        .foregroundColor(.orange)
                }
                
                Spacer()
                    .frame(width: 180, alignment: .center)
                
                Button(action: {
                    self.open = true
                }){
                    Image(systemName: "cart")
                        
                }
                .foregroundColor(.orange)
            }
            .sheet(isPresented: $open) {
                ShoppingCartView(main: Main(), itemCount: $count)
            }
            
            Spacer()
        }
        .edgesIgnoringSafeArea(.top)
        
    }
}

struct classOne_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            classOne()
        }
    }
}

struct CHShape : Shape {
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.bottomLeft, .bottomRight], cornerRadii: CGSize(width: 45, height: 45))
        
        return Path(path.cgPath)
    }
}
