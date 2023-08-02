//
//  ContentView.swift
//  SpotfyClone
//
//  Created by Student18 on 01/08/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isShowingDetailView = false
    @State private var searchText = ""

    
    let songs: [Song] = [
        Song(id:0, name: "Saudade de minha Terra", artist:"Goiá", capa: "https://akamai.sscdn.co/letras/360x360/albuns/0/a/5/2/1016231612981739.jpg"),
        Song(id:1,name: "Coromandel", artist: "Goiá", capa: "https://akamai.sscdn.co/letras/360x360/albuns/0/a/5/2/1016231612981739.jpg"),
        Song(id:2,name: "Saudade de Coromandel", artist: "Goiá", capa: "https://akamai.sscdn.co/letras/360x360/albuns/0/a/5/2/1016231612981739.jpg"),
        Song(id:3,name: "Recanto Caipira", artist: "Goiá", capa: "https://akamai.sscdn.co/letras/360x360/albuns/0/a/5/2/1016231612981739.jpg"),
        Song(id:4,name: "Tipos da Minha Terra", artist: "Goiá", capa: "https://akamai.sscdn.co/letras/360x360/albuns/0/a/5/2/1016231612981739.jpg"),
    ]
    
    let sugest: [Sugestions] = [
        Sugestions(id: 0, albumCover: "https://is1-ssl.mzstatic.com/image/thumb/Music124/v4/84/69/10/84691084-8fc4-80b2-180c-d49b7a784ad6/mzi.txvmmcoo.jpg/600x600bf-60.jpg", albumName: "Luar do Sertão"),
        Sugestions(id: 1, albumCover: "https://i1.sndcdn.com/artworks-a0981927-3a2e-45b5-aee6-643e7fbeb3bf-0-t500x500.jpg", albumName: "Luar do Sertão"),
        Sugestions(id: 2, albumCover: "https://cdns-images.dzcdn.net/images/cover/8b85e9978a5448d3bf0e070566a9e3ad/264x264.jpg", albumName: "Luar do Sertão")
        
        
        ]
    
    var filteredMusic: [Song] {
        if searchText.isEmpty {
            return songs
        } else {
            return songs.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }


    var body: some View {
        NavigationStack{
            ZStack{
                Rectangle().fill(
                    Gradient(colors: [.blue,.black,.black])).ignoresSafeArea()
                VStack {
                    
                    AsyncImage(url: URL(string: "https://akamai.sscdn.co/letras/360x360/albuns/0/a/5/2/1016231612981739.jpg")) { image in
                        image.resizable()
                    } placeholder: {
                        Color.gray
                    }
                    .frame(width: 200, height: 200)
                    Text("Saudades de Coramandel").font(.largeTitle).colorInvert()
                    
                    HStack {
                        AsyncImage(url: URL(string: "https://akamai.sscdn.co/letras/360x360/albuns/0/a/5/2/1016231612981739.jpg")) { image in
                            image.resizable()
                        } placeholder: {
                            Color.gray
                        }
                        .frame(width: 25, height: 25)
                        Text("Goiá")
                            .foregroundColor(.white)
                        
                        Spacer()
                    }
                    
                    ScrollViewReader { value in
                        ScrollView {
                            VStack{
                                
                                
                                
                                    ForEach(filteredMusic, id:\.id) { i in
                                        NavigationLink(destination:Play(musica: i)){
                                        HStack{AsyncImage(url: URL(string: i.capa)) { image in
                                            image.resizable()
                                        } placeholder: {
                                            Color.gray
                                        }.frame(width: 50, height: 50)
                                            VStack{
                                                Text("\(i.name)")
                                                    .font(.title)
                                                    .foregroundColor(.white)
                                                Text("\(i.artist)").foregroundColor(.white)
                                            }
                                            Spacer()
                                            Image(systemName: "ellipsis")
                                                .foregroundColor(.gray)
                                        }
                                    }
                                    
                                    }.searchable(text: $searchText).toolbarBackground(.hidden, for: .navigationBar)

                                
                                Text("Sugeridos:").font(.largeTitle).colorInvert()
                                ScrollView(.horizontal){
                                    HStack{
                                        ForEach(sugest, id:\.id) { i in
                                            VStack{
                                                AsyncImage(url: URL(string: i.albumCover)) { image in
                                                    image.resizable()
                                                } placeholder: {
                                                    Color.gray
                                                }
                                                .frame(width: 200, height: 200)
                                                Text(i.albumName).colorInvert()}
                                        }
                                        
                                    }
                                }
                            }
                        }
                        
                    }
                }
                .padding()
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
