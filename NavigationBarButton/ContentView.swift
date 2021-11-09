//
//  ContentView.swift
//  NavigationBarButton
//
//  Created by devadmin on 09.11.21.
//

import SwiftUI

struct ContentView: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var password = ""
    @State private var selectedColor: Color = .red
    @State private var isLoading = false
    
    var body: some View {
        NavigationView {
            VStack {
                Circle()
                    .foregroundColor(selectedColor)
                    .frame(width: 200, height: 200)
                    .padding()
                
                Form {
                    Section(header: Text("Hello, world!")) {
                        TextField("First Name", text: $firstName)
                        TextField("Last Name", text: $lastName)
                        TextField("Email", text: $email)
                        SecureField("Password Name", text: $password)
                    }.unredacted()
                    Section(header: Text("Color Picker")) {
                        ColorPicker("Select Color", selection: $selectedColor).disabled(isLoading)
                    }
                }.navigationTitle("Profile")
                    .toolbar {
                        ToolbarItemGroup(placement: .navigationBarTrailing) {
                            Link(destination: URL(string: "https://www.apple.com")!) {
                                Text("apple")
                            }.disabled(isLoading)
                            Button {
                                print("sdfnm")
                            } label: {
                                Image(systemName: "arrow.down")
                            }.disabled(isLoading)
                        }
                    }
            }
        }.accentColor(.red)
            .onAppear {
                startNetworkCall()
            }
            .redacted(reason: isLoading ? .placeholder : [])
    }
    
    func startNetworkCall() {
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            isLoading = false
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
