//
//  ContentView.swift
//  onesystem_swiftui
//
//  Created by Oğuz KABA on 23.05.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            AppLogo()
            
            CustomTextField()
            
            CustomSecureTextField()
            
            CustomButton(bgColor: .accentColor,label: "Login")
            CustomButton(bgColor: .primary,label: "Exit")
        }
    }
}

struct AppLogo : View {
    var body: some View {
        Image("app_logo")
            .resizable()
            .scaledToFit()
            .padding(.all,40)
    }
}

struct CustomTextField : View {
    @State var username : String=""
    let tfBackColor : Color = Color(red: 239/255, green: 243/255, blue: 244/255)
    
    var body: some View {
        HStack {
            Image(systemName: "person")
            TextField("UserName", text: $username)
        }
        .frame(width: UIScreen.main.bounds.size.width*0.85, height: 30)
        .padding()
        .overlay(RoundedRectangle(cornerRadius:10).stroke().foregroundColor(.gray))
        .background(tfBackColor)
    }
}

struct CustomSecureTextField : View {
    @State var username : String=""
    let tfBackColor : Color = Color(red: 239/255, green: 243/255, blue: 244/255)
    
    var body: some View {
        HStack {
            Image(systemName: "lock")
            SecureField("Password", text: $username)
        }
        .frame(width: UIScreen.main.bounds.size.width*0.85, height: 30)
        .padding()
        .overlay(RoundedRectangle(cornerRadius:10).stroke().foregroundColor(.gray))
        .background(tfBackColor)
        .padding(.bottom,40)
    }
}

struct CustomButton : View {
    let bgColor : Color
    let label : String
    
    var body: some View {
        Button(action: {
            print("Button Tap..!")
        }){
            HStack{
                Text(label)
                    .foregroundColor(.white)
                    .fontWeight(.black)
                Image("cart")
            }
        }
        .frame(width: UIScreen.main.bounds.size.width*0.85, height: 30)
        .padding()
        .background(bgColor)
        .cornerRadius(10)
        .onTapGesture {
            hideKeyboard()
        }
    }
}

extension View{
    func hideKeyboard(){
        let resign=#selector(UIResponder.resignFirstResponder)
        UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
