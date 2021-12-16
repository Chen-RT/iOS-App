//
//  FeedbackView.swift
//  order (iOS)
//
//  Created by 陈润桐 on 2021/12/13.
//

import SwiftUI

struct FeedbackView: View {
    @State private var name = ""
    @State private var phone = ""
    @State private var address = ""
    @State private var tagIndex = 0
    @State private var showAlert = false
    
    let tags = ["差", "中", "好"]
    
    var confirmMsg: String {
            """
            收货人是:\(name)
            手机号: \(phone)
            详细地址: \(address)
            标签: \(tags[tagIndex])
            """
    }
    
    var invalidInput: Bool {
        name.isEmpty || phone.isEmpty || address.isEmpty
    }
    
    var body: some View {
        
        Form {
            Section {
                HStack {
                    Text("建议")
                    TextField("请提出您宝贵的建议", text: $name)
                }
                HStack {
                    Text("手机")
                    TextField("请填写联系人手机号", text: $phone)
                        .keyboardType(.numberPad)
                }
            }
            
            Section(header: Text("标签")) {
                Picker("xx", selection: $tagIndex) {
                    ForEach(0..<tags.count, id: \.self) { index in
                        Text(self.tags[index])
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            
            Section {
                Button("完成") {
                    self.showAlert = true
                }.disabled(invalidInput)
                
            }
            
        }
        .navigationBarTitle("提出建议")
        .alert(isPresented: $showAlert) {
            Alert(title: Text("确认地址"),
                  message: Text(confirmMsg),
                  dismissButton: .default(Text("确认")))
            
        }
    }
}

struct FeedbackView_Previews: PreviewProvider {
    static var previews: some View {
        FeedbackView()
    }
}
