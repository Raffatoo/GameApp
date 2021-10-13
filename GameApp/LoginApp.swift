//
//  LoginApp.swift
//  GameApp
//
//  Created by Cruz Torres on 12/10/21.
//

import SwiftUI

struct LoginApp: View {
    var body: some View {
        
        NavigationView {
            
            ZStack{
                Color("ColorBlackBlue")
                    .ignoresSafeArea()
                VStack{
                    Image("Logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 250,alignment: .center)
                    
                    LoginUserView()
                    
                    Spacer()
                }
            }.navigationBarHidden(true)
            
        }
    }
}


struct LoginUserView: View {
    
    @State var tipoInicioSesion = true
    
    var body: some View {
        VStack{
            HStack{
                Button(action: {
                    tipoInicioSesion = true
                }, label: {
                    Text("INICIA SESIÓN")
                        .foregroundColor(tipoInicioSesion ? .white : .white.opacity(0.5))
                        .fontWeight(.bold)
                })
                Spacer()
                Button(action: {
                    tipoInicioSesion = false
                }, label: {
                    Text("REGÍSTRATE")
                        .foregroundColor(tipoInicioSesion ? .white.opacity(0.5) : .white )
                        .fontWeight(.bold)
                })
            }
            .padding(.bottom, 20)
            
            if tipoInicioSesion == true {
                InicioSesionView()
            } else {
                RegistroSesionView()
            }
        }
        .padding()
    }
}


struct InicioSesionView: View {
    
    @State var correo = ""
    @State var contrasena = ""
    @State var isPantallaHomeActive = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
            
            textInForm(textGive: "Correo Electrónico", textExample: "ejemplo@gmail.com", nameVar: correo)
            
            textInForm(textGive: "Contraseña", textExample: "escribe tu contraseña", nameVar: contrasena)
            
            
            Button(action: {
                print("Olvide")
            }, label: {
                HStack{
                    Spacer()
                    Text("¿Olvidaste tu Contraseña?")
                        .foregroundColor(Color("ColorGreen10"))
                        .font(.caption)
                }
            })
            
            Button(action: iniciarSesion, label: {
                Text("INICIAR SESIÓN")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                    .overlay(RoundedRectangle(cornerRadius:8.0).stroke(Color("ColorGreen10"), lineWidth: 1.0).shadow(color: Color.white, radius: 6))
                    .padding(.top, 60)
            })
            .padding(.bottom, 30)
            
            
            
            Text("Inicia sesión con redes sociales")
                .frame(maxWidth: .infinity, alignment: .center)
                .foregroundColor(.white)

            HStack {
                
                Button(action: {
                    //iniciarSesionFacebook
                }, label: {
                    Text("Facebook")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                        .background(Color("ColorLightBlue"))
                        .cornerRadius(10)
                })
                
                Button(action: {
                    //iniciarSesionTwitter
                }, label: {
                    Text("Twetter")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                        .background(Color("ColorLightBlue"))
                        .cornerRadius(10)
                })
                
            }
            .padding(.top, 30)
            
        }
            
            NavigationLink(
                destination: HomeView(),
                isActive: $isPantallaHomeActive,
                label: {
                    EmptyView()
                })
        }
    }
    
    func iniciarSesion() {
        print("Estoy Iniciando Sesión")
        isPantallaHomeActive = true
    }
}

struct RegistroSesionView: View {
    
    @State var correo = ""
    @State var contrasena = ""
    @State var Contrasena = ""
    
    var body: some View {
        
        VStack(alignment: .center){
            Text("Elije una foto de perfil")
                .font(.title2)
                .foregroundColor(.white)
                .padding(.top, 30)
            
            ZStack {
                Image("hols")
                    .resizable()
                    .frame(width: 80, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Image(systemName: "camera")
                    .font(.title)
                    .foregroundColor(.white)
            }
        }
        
        ScrollView {
            
            VStack(alignment: .leading) {
                
                textInForm(textGive: "Correo Electrónico", textExample: "ejemplo@gmail.com", nameVar: correo)
                
                textInForm(textGive: "Contraseña", textExample: "escribe tu contraseña", nameVar: contrasena)
                
                textInForm(textGive: "Confirma tu Contraseña", textExample: "confirma tu contraseña", nameVar: Contrasena)
                
                Button(action:{
                    print("Regístrate")
                }, label: {
                    Text("REGÍSTRATE")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                        .overlay(RoundedRectangle(cornerRadius:8.0).stroke(Color("ColorGreen10"), lineWidth: 1.0).shadow(color: Color.white, radius: 6))
                        .padding(.top, 60)
                })
                .padding(.bottom, 30)
                
                
                
                Text("Inicia sesión con redes sociales")
                    .frame(maxWidth: .infinity, alignment: .center)
                    .foregroundColor(.white)
                
                HStack {
                    
                    Button(action: {
                        //iniciarSesionFacebook
                    }, label: {
                        Text("Facebook")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                            .background(Color("ColorLightBlue"))
                            .cornerRadius(10)
                    })
                    
                    Button(action: {
                        //iniciarSesionTwitter
                    }, label: {
                        Text("Twetter")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                            .background(Color("ColorLightBlue"))
                            .cornerRadius(10)
                    })
                    
                }
                .padding(.top, 30)
                
            }
        }
    }
}


struct LoginApp_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LoginApp()
        }
    }
}


struct textInForm: View {
    var textGive: String
    var textExample: String
    @State var nameVar = ""
 
    var body: some View {
        VStack(alignment: .leading) {
            Text(textGive)
                .foregroundColor(Color("ColorGreen10"))
                .padding(.top, 30)
            
            ZStack(alignment: .leading){
                if nameVar.isEmpty {
                    Text(textExample)
                        .font(.caption)
                        .foregroundColor(.white.opacity(0.5))
                }
                
                TextField("", text: $nameVar)
                    .foregroundColor(.white)
            }
            
            Divider()
                .frame(height: 1)
                .background(Color("ColorGreen10"))
        }
    }
}
