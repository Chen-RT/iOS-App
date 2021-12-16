//
//  ContentView.swift
//  Shared
//
//  Created by 陈润桐 on 2021/12/8.
//

import SwiftUI

struct ContentView: View {
    
    let array = ["牛排", "布丁", "土豆"]
    @State private var searchTerm : String = ""
    
    @State var text: String
    @State private var isEditing = false
    
    private var search: some View {
        //下面是一个白色"药丸形状",上面是"放大镜"图标和文字
        ZStack {
            Capsule()
                .fill(Color.white)
                .frame(width: UIScreen.main.bounds.width - 76, height: 34, alignment: .center)
            //左边是放大镜,中间是文字,右边是 Spacer
            HStack {
                Text(Image(systemName: "magnifyingglass"))
                    .font(.system(size: 14))
                Text("搜索关键词")
                    .font(.system(size: 13))
                    .foregroundColor(.secondary)
                    .lineLimit(1)
                Spacer()
            }
            .padding(.leading, 12)
        }
        .offset(CGSize(width: 0, height: -1))
    }

    private var publish: some View {
        //上面是"相机"图标,下面是"发布"文字. 全部设置为白色
        VStack {
            Text(Image(systemName: "camera.fill"))
                .font(.title3)
            Text("发布")
                .font(.caption)
                .fontWeight(.bold)
        }
        .foregroundColor(.white)
    }
        
    var body: some View {
        
        TabView {
            
            NavigationView {
                
                VStack {
                    HStack {
                        Text("选择类别").bold()
                            .navigationBarItems(leading: search, trailing: publish)
                            .font(.system(size: 40))
                        
                    }
                    
                    HStack {
                        Spacer()
                    }
                    Spacer().frame(height: 100)
                    NavigationLink(destination: MenuView()) {
                        
                        ZStack {
                            Image("canyin_1")
                                .resizable()
                                .frame(width: 90, height: 90, alignment: .center)
                        }
                        Text("类型1").bold()
                            .frame(maxWidth: 250, alignment: .center)
                            .font(.system(size: 30))
                    }.padding()
                        .background(Color.yellow)
                        .foregroundColor(Color.black)
                        .cornerRadius(10)
                        .shadow(radius: 10)
                    
                    
                    NavigationLink(destination: classOne()) {
                        ZStack {
                            Image("canyin_2")
                                .resizable()
                                .frame(width: 90, height: 90, alignment: .center)
                        }
                        Text("类型2").bold()
                            .frame(maxWidth: 250, alignment: .center)
                            .font(.system(size: 30))
                    }
                    .padding()
                    .background(Color.yellow)
                    .foregroundColor(Color.black)
                    .cornerRadius(10)
                    .shadow(radius: 10)
                    
                    NavigationLink(destination: classOne()) {
                        ZStack {
                            Image("canyin_3")
                                .resizable()
                                .frame(width: 90, height: 90, alignment: .center)
                        }
                        Text("类型3").bold()
                            .frame(maxWidth: 250, alignment: .center)
                            .font(.system(size: 30))
                    }
                    .padding()
                    .background(Color.yellow)
                    .foregroundColor(Color.black)
                    .cornerRadius(10)
                    .shadow(radius: 10)
                }
                .navigationTitle("主页")
                
            }
            .tabItem {
                Image(systemName: "books.vertical")
                Text("Home")
            }
            
            NavigationView {
                VStack {
                    
                    List {
                        NavigationLink(destination: AdressView()) {
                            ZStack {
                                Text("默认收货地址")
                            }
                        }
                        NavigationLink(destination: FeedbackView()) {
                            ZStack {
                                Text("支付方式")
                            }
                        }
                    }
                }
                .navigationTitle("反馈")
                
            }
            .tabItem {
                Image(systemName: "gearshape")
                Text("Setting")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(text: "")
    }
}
