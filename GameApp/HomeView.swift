//
//  HomeView.swift
//  GameApp
//
//  Created by Cruz Torres on 12/10/21.
//

import SwiftUI

struct HomeView: View {
    
    @State var tabSelect: Int = 2
    
    var body: some View {
        
        TabView(selection: $tabSelect) {
            
            Text("Holla App Game").font(.system(size: 20))
                .tabItem { Image(systemName: "person")
                    Text("Perfil")
                }.tag(0)
            
            Text("Holla App Game").font(.system(size: 20))
                .tabItem { Image(systemName: "gamecontroller")
                    Text("Games")
                }.tag(1)
            
            //Text("Holla App Game").font(.system(size: 20))
                PantallaHome()
                .tabItem { Image(systemName: "house")
                    Text("Inicio")
                }.tag(2)
            
            Text("Holla App Game").font(.system(size: 20))
                .tabItem { Image(systemName: "heart")
                    Text("Favoritos")
                }.tag(3)
        }
        .accentColor(.white)
    }
    
    init() {
        
        UITabBar.appearance().barTintColor = UIColor(Color("ColorTabBar"))
        UITabBar.appearance().isTranslucent = true
    
        print("Iniciando las vistas de Home")
    }
}



struct PantallaHome: View {
    
    @State var textoBusqueda = ""
    
    var body: some View {
        ZStack {
            Color("ColorBlackBlue")
                .ignoresSafeArea()
            VStack {
                Image("Logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250,alignment: .center)
                HStack {
                    Button(action: busquedaText, label: {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(textoBusqueda.isEmpty ? Color.yellow : Color("ColorGreen10"))
                    })
                    
                    ZStack(alignment: .leading) {
                        if textoBusqueda.isEmpty {
                            Text("Buscar un video")
                                .foregroundColor(.white.opacity(0.5))
                        }
                        TextField("", text: $textoBusqueda)
                            .foregroundColor(.white)
                        
                    }
                    
                }
                .padding([.top, .leading, .bottom], 11.0)
                .background(Color("ColorLightBlue"))
                .clipShape(Capsule())
            }.padding(.horizontal, 18)

     
            
        }
    }
    
   
    func busquedaText() {
        print("El usuario esta buscando \(textoBusqueda)")
    }
    
    
    
    
}






struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
