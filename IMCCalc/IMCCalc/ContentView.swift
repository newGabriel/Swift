//
//  ContentView.swift
//  IMCCalc
//
//  Created by Student18 on 28/07/23.
//

import SwiftUI

var pes = 0.0
var atr = 1.0
var imc = 0.0

struct ContentView: View {
    @State var massa = "0"
    @State var alt = "1"
    @State var calcular = false
    @State var res = "Normal"
    @State var cor = "normal"
    
    var body: some View {
        ZStack{
            Rectangle().fill(Color(cor))
            Spacer()
            VStack {
                Text("Calculadora IMC").font(.largeTitle)
                TextField("Massa",text: $massa)
                    .keyboardType(.decimalPad)
                    .textContentType(.oneTimeCode)
                    .multilineTextAlignment(.center)
                    .cornerRadius(67)
                    .frame(height: 50)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Altura",text: $alt).keyboardType(.decimalPad)
                    .textContentType(.oneTimeCode)
                    .multilineTextAlignment(.center)
                    .cornerRadius(67)
                    .frame(height: 50)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button("Calcular"){
                    pes = Double(massa) ?? 0.0
                    atr = Double(alt) ?? 1.0
                    imc = pes / (atr*atr)
                    
                    if imc < 18.5{
                        res = "Baixo peso"
                        cor = "baixo"
                    }else if imc < 24.99{
                        res = "Normal"
                        cor = "normal"
                    }else if imc < 29.99{
                        res = "Sobrepeso"
                        cor = "sobre"
                    }else{
                        res = "Obesidade"
                        cor = "obeso"
                    }
                }.buttonStyle(.borderedProminent)
                Text(res)
                Image("table")
                    .resizable()
                    .scaledToFit()
            }
            
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
