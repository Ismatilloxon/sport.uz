//
//  SignUp.swift
//  Spotr.uz
//
//  Created by mac on 03/12/21.
//
import SwiftUI

struct SignUp: View {
    @State var text = ""
    @State var nameT = ""
    @State var surNameT = ""
    @State var current_date = Date()
    @State var selectedRegion = "Toshkent"
    @State var selectedSport = "Stol tennisi"
    @State var showRegionSheet = false
    @State var showTumanSheet = false
    @State var showStateSheet = false
    @State var showChooseSportSheet = false
    @State var selectedState = "Sportchi"
    @State var homeView = false
    
    let tumanlar = Regions()
    let regions = ["Toshkent viloyati","Andijon viloyati","Buxoro viloyati","Fargʻona viloyati","Jizzax viloyati","Xorazm viloyati","Namangan viloyati","Navoiy viloyati","Qashqadaryo viloyati","Qoraqalpogʻiston Respublikasi","Samarqand viloyati","Sirdaryo viloyati","Surxondaryo viloyati"]
    let sports = ["Yengil Atletika","Suzish","Basketbol", "Suzish", "Futbol", "Voleybol", "Karate", "Boks","Qilichbozlik","Gandbol","Dzyudo","Eshkak eshish","Stol tennisi","Tennis", "Qo'l to'pi"]
    
    
    var body: some View {
        VStack {
                ScrollView {
                    phoneNumber
                    name
                    surName
                    bolim
                    chooseSport
                    picker
                    region
                    tuman
                    signUPButton
                        .clipShape(Capsule())
                        
                }
            if homeView {
                NavigationLink(destination: ContentView(), isActive: $homeView) {}
            }
        }.navigationTitle("Sign Up")
    }
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}
extension SignUp {
    private var phoneNumber: some View {
        
        VStack(alignment:.leading, spacing:0) {
            Text("Enter your mobile number")
                .font(.system(size: 14))
                .padding(.bottom, 10)
                .padding(.top)
               
            Text("\(Text("*").foregroundColor(.red)) Use your phone number")
                .font(.system(size: 14))
                .multilineTextAlignment(.leading)
                .padding(.bottom, 15)
            RoundedRectangle(cornerRadius: 20)
                .fill(.white)
                .shadow(color: .black.opacity(0.2), radius: 3, x: 1, y: 2)
                
                .overlay(
            HStack(spacing: 10) {
                Text("🇺🇿")
                    .lineLimit(1)
                    .fixedSize(horizontal: true, vertical: false)
                    .font(.system(size: 17))
                    .padding(.leading, 15)
                
                HStack(spacing: 0) {
                    
                    Text("+998")
                        .font(.system(size: 17))
                        .fixedSize(horizontal: true, vertical: false)
                        .padding(.trailing, 9)
                    
                    TextField("(__) ___-__-__", text: $text, onEditingChanged: { typing in
                        withAnimation(.easeInOut(duration: 0.3)) {
                            
                        }
                        
                    })
                        .font(.system(size: 17))
                        .frame(width: 150)
                        .padding(.trailing, 30)
                        .disableAutocorrection(true)
                        .keyboardType(.numberPad)
                }
                Spacer()
            }
            .padding(.top,16)
                ).frame(height: 50)
        }
        .frame(width: UIScreen.main.bounds.width-32, alignment: .leading)
    }
    
    private var name: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(.white)
            .shadow(color: .black.opacity(0.2), radius: 3, x: 1, y: 2)
            .overlay(
                HStack {
                    Text("Name: ")
                        .font(.system(size: 17))
                    
                        .padding()
                    TextField(
                        "Enter your name: ",text: $nameT
                    )
                }
            )
            
            .frame(width: UIScreen.main.bounds.width - 32, height: 50)
            .padding()
    }
    
    private var surName: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(.white)
            .shadow(color: .black.opacity(0.2), radius: 3, x: 1, y: 2)
            .overlay(
                HStack {
                    Text("Surname: ")
                        .font(.system(size: 17))
                    
                        .padding()
                    TextField(
                        "Enter your surname: ",text: $surNameT
                    )
                }
            )
            
            .frame(width: UIScreen.main.bounds.width - 32, height: 50)
            .padding()
    }
    
    private var chooseSport: some View {
        VStack(alignment: .leading) {
            Text("Sportingizni tanlang ")
                .font(.system(size: 17))
                .padding(.vertical)
            Button(action: {
                showChooseSportSheet = true
            }) {
                RoundedRectangle(cornerRadius: 20)
                    .fill(.white)
                    .shadow(color: .black.opacity(0.2), radius: 3, x: 1, y: 2)
                    .frame(width: UIScreen.main.bounds.width - 32, height: 50)
                    .overlay(
                        HStack {
                            Text(selectedSport)
                                .font(.system(size: 17))
                                .foregroundColor(.black)
                            Spacer()
                            Image(systemName: "chevron.down")
                                .foregroundColor(.black)
                        }.padding(.horizontal)
                    )
            }
            .sheet(isPresented: $showChooseSportSheet) {
                List(sports,id: \.self) { sport in
                    Button(action: {
                        selectedSport = sport
                        showChooseSportSheet = false
                    }) {
                        Text(sport)
                            .font(.system(size: 17))
                            .foregroundColor(.black)
                    }.frame(height: 40)
                }
            }
        }
    }
    
    private var picker: some View {
        DatePicker("Enter Your Birthday", selection: $current_date, displayedComponents: [.date])
                            .padding()
    }
    
    private var region: some View {
        VStack(alignment: .leading) {
            Text("Viloyatingizni tanlang ")
                .font(.system(size: 17))
                .padding(.vertical)
            Button(action: {
                showRegionSheet = true
            }) {
                RoundedRectangle(cornerRadius: 20)
                    .fill(.white)
                    .shadow(color: .black.opacity(0.2), radius: 3, x: 1, y: 2)
                    .frame(width: UIScreen.main.bounds.width - 32, height: 50)
                    .overlay(
                        HStack {
                            Text(selectedRegion)
                                .font(.system(size: 17))
                                .foregroundColor(.black)
                            Spacer()
                            Image(systemName: "chevron.down")
                                .foregroundColor(.black)
                        }.padding(.horizontal)
                    )
            }
        }
        .sheet(isPresented: $showRegionSheet) {
            List(regions,id: \.self) { region in
                Button(action: {
                    selectedRegion = region
                    showRegionSheet = false
                }) {
                    Text(region)
                        .font(.system(size: 17))
                        .foregroundColor(.black)
                }.frame(height: 40)
            }
        }
    }
    
    private var tuman: some View {
        VStack(alignment: .leading) {
            Text("Tumaningizni tanlang ")
                .font(.system(size: 17))
                .padding(.vertical)
        Button(action: {
            showTumanSheet = true
        }) {
                RoundedRectangle(cornerRadius: 20)
                    .fill(.white)
                    .shadow(color: .black.opacity(0.2), radius: 3, x: 1, y: 2)
                    .frame(width: UIScreen.main.bounds.width - 32, height: 50)
                    .overlay(
                        HStack {
                            Text(selectedRegion == "Toshkent" || selectedRegion == "Toshkent viloyati" ? tumanlar.toshkent[0] : tumanlar.andijon[0])
                                .font(.system(size: 17))
                                .foregroundColor(.black)
                            Spacer()
                            Image(systemName: "chevron.down")
                                .foregroundColor(.black)
                        }.padding(.horizontal)
                    )
            
        }
        }
        .sheet(isPresented: $showTumanSheet) {
            List(selectedRegion == "Toshkent" || selectedRegion == "Toshkent viloyati" ? tumanlar.toshkent : tumanlar.andijon,id: \.self) { region in
                Button(action: {
                    selectedRegion = region
                    showTumanSheet = false
                }) {
                    Text(region)
                        .font(.system(size: 17))
                        .foregroundColor(.black)
                }.frame(height: 40)
            }
        }
    }
    
    private var bolim: some View {
        VStack(alignment: .leading) {
            Text("Bo'limni tanlang ")
                .font(.system(size: 17))
                .padding(.vertical)
            Button(action: {
                showStateSheet = true
            }) {
                RoundedRectangle(cornerRadius: 20)
                    .fill(.white)
                    .shadow(color: .black.opacity(0.2), radius: 3, x: 1, y: 2)
                    .frame(width: UIScreen.main.bounds.width - 32, height: 50)
                    .overlay(
                        HStack {
                            Text(selectedState)
                                .font(.system(size: 17))
                                .foregroundColor(.black)
                            Spacer()
                            Image(systemName: "chevron.down")
                                .foregroundColor(.black)
                        }.padding(.horizontal)
                    )
            }
            .sheet(isPresented: $showStateSheet) {
                List(["Sportchi","Murabbiy","Sport maktab", "Sport federatsiyadi"],id: \.self) { sport in
                    Button(action: {
                        selectedSport = sport
                        showStateSheet = false
                    }) {
                        Text(sport)
                            .font(.system(size: 17))
                            .foregroundColor(.black)
                    }.frame(height: 40)
                }
            }
        }
    }
    
    private var signUPButton: some View {
        Button(action: {
            homeView = true
        }) {
            Text("Ro'yxatdan o'tish")
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
                .frame(width: UIScreen.main.bounds.width - 32, height: 50, alignment: .center)
                .clipShape(Capsule())
               
        }
        .clipShape(Capsule())
        .background(Color.blue)
            .padding(.vertical)
            .cornerRadius(20)
            
    }
}
struct Regions {
    let andijon = ["Andijon shaxri","Asaka","Baliqchi",
                    "Boʻston",
                    "Buloqboshi",
                   "Izboskan",
                    "Jalaquduq",
                   "Xoʻjaobod",
                    "Qoʻrgʻontepa",
                   "Marhamat",
                   "Oltinkoʻl",
                     "Paxtaobod",
                   "Shahrixon",
                    "Ulugʻnor"]
    let toshkent = ["Toshkent shaxri","Bekobod tumani","Boʻstonliq tumani","Boʻka tumani","Chinoz tumani","Qibray tumani","Ohangaron tumani","Oqqoʻrgʻon tumani",
    "Parkent tumani","Piskent tumani","Quyi chirchiq tumani","Oʻrta Chirchiq tumani","Yangiyoʻl tumani","Yuqori Chirchiq tumani","Zangiota tumani"
    ]
                   
}

