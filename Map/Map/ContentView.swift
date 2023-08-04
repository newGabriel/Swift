//
//  ContentView.swift
//  Map
//
//  Created by Student18 on 03/08/23.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    @State var botao = false
    
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: -22.9137906, longitude: -43.7756431), span: MKCoordinateSpan(latitudeDelta: 40, longitudeDelta: 40))

    
    @State var locs: [Location] = [
        Location(
            name: "Brasil",
            coordinate: CLLocationCoordinate2D(
                latitude: -22.9137906,
                longitude: -43.7756431
            ),
            flag: "https://agendabonifacio.com.br/wp-content/uploads/2022/04/curiosidade-9.jpeg",
            description: "Melhor País. Quem comcorda respira"
            
        ),
        Location(
            name: "Reino Unido",
            coordinate: CLLocationCoordinate2D(
                latitude: 51.5285262,
                longitude: -0.2664052
            ),
            flag: "https://i.pinimg.com/originals/c3/31/7e/c3317ece9963186a4a7f383d3a4b36bf.png",
            description: "Reino Unido da Gran Bretanha e irlanda do Norte"
            
        ),
        Location(
            name: "França",
            coordinate: CLLocationCoordinate2D(
                latitude: 48.8588255,
                longitude: 2.2646344
            ),
            flag: "https://i.pinimg.com/1200x/93/73/13/937313f05bdc84c53dde262ed7db0174.jpg",
            description: "País revoltado com a vida"
            
        ),
        Location(
            name: "Vaticano",
            coordinate: CLLocationCoordinate2D(
                latitude: 41.9038162,
                longitude: 12.4469113
            ),
            flag: "https://img.freepik.com/fotos-premium/foto-texturizada-da-bandeira-da-cidade-do-vaticano_379201-4779.jpg",
            description: "Salve Roma Eterna"
            
        )
    
    ]
    
    @State var Aloc = Location(
        name: "Brasil",
        coordinate: CLLocationCoordinate2D(
            latitude: -22.9137906,
            longitude: -43.7756431
        ),
        flag: "https://agendabonifacio.com.br/wp-content/uploads/2022/04/curiosidade-9.jpeg",
        description: "Melhor País. Quem comcorda respira"
        
    )
    
    var body: some View {
        VStack{
            Map( coordinateRegion: $mapRegion, annotationItems: locs){ loc in
                MapAnnotation(coordinate: loc.coordinate){
                    NavigationLink {
                        Text(loc.name)
                    } label: {
                        Circle()
                            .stroke(.blue, lineWidth: 10)
                    }.onTapGesture {
                        botao.toggle()
                        Aloc = loc
                    }
                }
            }.sheet(isPresented: $botao){
                Text(Aloc.name).font(.title)
                AsyncImage(url: URL(string: Aloc.flag)) { image in
                    image.resizable()
                } placeholder: {
                    Color.gray
                }
                .frame(width: 100, height: 60)
                Text(Aloc.description)
            }
            ScrollView(.horizontal){
                HStack{
                    ForEach(locs){ loc in
                        
                        AsyncImage(url: URL(string: loc.flag)) { image in
                            image.resizable()
                        } placeholder: {
                            Color.gray
                        }
                        .frame(width: 80, height: 50).onTapGesture {
                            mapRegion.center = loc.coordinate
                        }
                        
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//brasil, UK, frança, vaticano
