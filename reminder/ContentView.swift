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
    var body: some View {
        NavigationView{
            
            
            
            
/*                ForEach(searchResults, id: \.self) { name in
                    NavigationLink {
                        Text(name)
                    } label: {
                        Text(name)
                    }
                }*/
                
                
                
                cardsReminderView()
      
             

            
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

            
            
        }
        .searchable(text: $searchText)
        
        
        
        
        
    }
    
    
    
    var searchResults: [String] {
        if searchText.isEmpty {
            return names
        } else {
            return names.filter { $0.contains(searchText) }
        }
    }
    
    
    
    func addSamples() {
        let rome = Reminder(titolo: "Rome")
        let florence = Reminder(titolo: "Florence")
        let naples = Reminder(titolo: "Naples")
        modelContext.insert(rome)
        modelContext.insert(florence)
        modelContext.insert(naples)
    }
}

#Preview {
    ContentView()
}



