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
                    
                    
                    if searchText.isEmpty {
                        // Mostra la vista delle card quando non si sta cercando
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
                    } else {
                        // Mostra i risultati della ricerca
                        
                        ForEach(filteredReminders) { reminder in
                            if !reminder.completato {
                                TaskCell(reminder: reminder)
                                    .listRowBackground(Color.clear)
                                    .listRowInsets(EdgeInsets())
                                  
                            }
                        }
                    }
                }
                .background(colorScheme == .dark ? Color.black : Color.clear)
                
              
                
            }
            .background(colorScheme == .dark ? Color.black : Color.clear)
            
            
            
            
            
            
            .searchable(text: $searchText)
        }
        
    }
    
    var filteredReminders: [Reminder] {
        if searchText.isEmpty {
            return reminders
        } else {
            return reminders.filter { $0.titolo.contains(searchText) }
        }
    }
    
    
    
    func addSamples() {
        let r1 = Reminder(titolo: "Apple Academy",note: "Arriva in tempo e ricorda di fare Badge-in!")
        let r2 = Reminder(titolo: "Andare dal Dentista")
        let r3 = Reminder(titolo: "Pranzo al Sushi", note: "Mangia più che puoi!")
        let r4 = Reminder(titolo: "Finisci NC1 ", note: "Finisci l'app Reminder e impara SwiftData",contrassegnato: true)
        let r5 = Reminder(titolo: "1v1 Mario Kart", note: "Batti Daniela su Mario Kart alle 11 in lab 2", completato: true)
        modelContext.insert(r1)
        modelContext.insert(r2)
        modelContext.insert(r3)
        modelContext.insert(r4)
        modelContext.insert(r5)
        
        
    }
}










#Preview {
    ContentView()
}



