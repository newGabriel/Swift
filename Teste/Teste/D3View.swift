//
//  ContentView.swift
//  Aula04
//
//  Created by Student25 on 27/07/23.
//

import SwiftUI

struct D3View: View {
    
    @State var nome = ""
    @State var showAlert = false
    
    var body: some View {
        ZStack {
            Image("caminhao")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .blur(radius: 3)
                .opacity(0.15)
            
            VStack{
                VStack{
                    Text("Bem vindo, \(nome)")
                        .font(.system(size: 32, weight: .semibold))
                    
                    TextField("Digite aqui", text: $nome)
                        .font(.title)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                }
                
                Spacer()
                
                VStack{
                    Image("logo")
                        .resizable()
                        .frame(width: 200, height: 100)
                        .shadow(radius: 10)
                    
                    Image("truck")
                        .resizable()
                        .frame(width: 200, height: 100)
                }
                
                Spacer()
                
                VStack{
                    Button("Entrar"){
                        showAlert = true
                    }.alert(isPresented: $showAlert){
                        Alert(
                            title: Text("ALERTA!"),
                            message: Text("Voce irá iniciar o desafio da aula agora"),
                            dismissButton: .default(Text("Vamos lá!"))
                        )
                    }
                }
                
                
            }
        }
        
    }
}

struct D3View_Previews: PreviewProvider {
    static var previews: some View {
        D3View()
    }
}
