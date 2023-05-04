//
//  LoginView.swift
//  Linkus
//
//  Created by 杨桂福 on 2022/9/14.
//

import SwiftUI

struct LoginView: View {
    @Binding var isLogin: Bool
    enum Field: Hashable { case name, password, localAddress, localPort, remoteAddress, remotePort }
    
    @State private var name = "1014"
    @State private var password = "eyJleHBpcmUiOjAsInNpZ24iOiJLYWdmYnpPMWg0R2taYjl2VUdRUUEvVllxVjZrUUZCVWl0cW4vdlc5ZStVPSIsInVzZXJuYW1lIjoiMTAxNCIsInZlcnNpb24iOiIxLjAifQ__"
    @State private var localAddress = "192.168.22.138"
    @State private var localPort = "8111"
    @State private var remoteAddress = ""
    @State private var remotePort = ""

    @FocusState private var isFocused: Field?
    
    var invalidInput: Bool {
        name.isEmpty || password.isEmpty || localAddress.isEmpty
    }
    
    var body: some View {
        Spacer()
        Form {
            TextField(text: $name, prompt: Text("Required")) {
                Text("Username")
            }
            .focused($isFocused, equals: .name)
            .frame(width: 200)
            
            TextField(text: $password, prompt: Text("Required")) {
                Text("password")
            }
            .focused($isFocused, equals: .password)
            .frame(width: 200)
                        
            TextField(text: $localAddress, prompt: Text("Required")) {
                Text("localAddress")
            }
            .focused($isFocused, equals: .localAddress)
            .frame(width: 200)
            
            TextField(text: $localPort, prompt: Text("Required")) {
                Text("localPort")
            }
            .focused($isFocused, equals: .localPort)
            .frame(width: 200)
            
            TextField(text: $remoteAddress, prompt: Text("Not Required")) {
                Text("remoteAddress")
            }
            .focused($isFocused, equals: .remoteAddress)
            .frame(width: 200)
            
            TextField(text: $remotePort, prompt: Text("Not Required")) {
                Text("remotePort")
            }
            .focused($isFocused, equals: .remotePort)
            .frame(width: 200)
                        
            Button("登录") {
                if name.isEmpty {
                    isFocused = .name
                } else if password.isEmpty {
                    isFocused = .password
                } else {
                    isFocused = nil
                    print("用户输入的没有问题,可以提交至服务器")
                    YLSSDK.shared().loginManager.login(name, token: password, localIP: localAddress, localPort: localPort, remoteIP: remoteAddress, remotePort: remotePort) { error in
                        if error == nil {
                            isLogin = true
                        }
                    }
                }
            }
            .disabled(invalidInput)
        }
        Spacer()
    }
}
