//
//  ContentView.swift
//  reminder
//
//  Created by Enrico Madonna on 13/11/23.
//
import SwiftData
import SwiftUI


struct ContentView: View {
    @Query var reminders: [Reminder]
    @Environment(\.modelContext) var modelContext
    let names = ["Holly", "Josh", "Rhonda", "Ted"]
    @State private var searchText = ""
    @State var isPresented:Bool = false
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        
           
                NavigationView{
                    
                    ZStack{
                       
                        Color(uiColor: .systemBackground)
                        Color(uiColor: .secondarySystemBackground)
                              .ignoresSafeArea(.all)
                        
                        ScrollView{
                            
                            
                            
                            
                            cardsReminderView(isPresented: $isPresented)
                             
                                .toolbar {
                                    
                                    ToolbarItem(placement:.secondaryAction ) {
                                        NavigationLink(destination: {comingSoonView()}, label: {
                                            Text("Modifica elenchi")
                                            Image(systemName: "pencil")})
                                    }
                                    
                                    ToolbarItem(placement:.secondaryAction ) {
                                        NavigationLink(destination: {comingSoonView()}, label: {
                                            Text("Modelli")
                                            Image(systemName: "square.on.square")})
                                    }
                                    
                                    ToolbarItem(placement: .bottomBar, content: {
                                        
                                        Button(action: {isPresented = true}, label: {
                                            Image(systemName: "plus.circle.fill")
                                            Text("Promemoria")
                                                .fontWeight(.bold)
                                        }).sheet(isPresented: $isPresented) {
                                            newReminderView(isPresented: $isPresented)
                                        }
                                    })
                                    
                                    ToolbarItem(placement: .bottomBar, content: {
                                        
                                        Button(action: {addSamples()}, label: {
                                            
                                            Text("Aggiungi elenco")
                                                .fontWeight(.bold)
                                            
                                            
                                            
                                        }).sheet(isPresented: $isPresented) {
                                            newReminderView(isPresented: $isPresented)
                                        }
                                    })
                                    
                                }
                            
                            /*  ForEach(searchResults, id: \.self) { name in
                             NavigationLink {
                             Text(name)
                             } label: {
                             Text(name)
                             }
                             }*/
                            
                        }
                        .background(colorScheme == .dark ? Color.black : Color.clear)

                        
                        
                        
                        
                        
                        .searchable(text: $searchText)
                    }
                
            }

                
            
            
        
           
    }
    
    
    
    var searchResults: [String] {
        if searchText.isEmpty {
            return reminders.map { $0.titolo }
        } else {
            return reminders.map { $0.titolo }.filter { $0.contains(searchText) }
        }
    }
    
    
    
    func addSamples() {
        let rome = Reminder(titolo: "Apple Academy",note: "Arriva in tempo e ricorda di fare Badge-in!")
        let florence = Reminder(titolo: "Andare dal Dentista")
        let naples = Reminder(titolo: "Pranzo al Sushi", note: "Mangia più che puoi!")
        modelContext.insert(rome)
        modelContext.insert(florence)
        modelContext.insert(naples)
    }
}

#Preview {
    ContentView()
}



