//
//  newReminderView.swift
//  reminder
//
//  Created by Enrico Madonna on 13/11/23.
//

import SwiftUI
import SwiftData
struct newReminderView: View {
    @Query var reminders: [Reminder]
    @Environment(\.modelContext) var modelContext
    
    @State private var titolo: String = ""
    
    @State private var note: String = ""
    
    @Binding var isPresented:Bool
    @FocusState var isFocused:Bool
    var body: some View {
        
        
        
        
        
        
        
        NavigationView{
            
            
            List{
                
                Section{
                    TextField("Titolo", text: $titolo, axis: .vertical)
                        .lineLimit(5)
                        .focused($isFocused)
                        .onAppear
                    {
                           
                                self.isFocused = true
                            
                        }
                    TextField("Note", text: $note, axis: .vertical)
                        .lineLimit(4...8)
                }
                
                Section{
                    NavigationLink("Dettagli") {
                        comingSoonView()
                    }
                    
                    
                }
                
                Section{
                    NavigationLink(destination: Text("Elenco")) {
                        Label {
                            HStack {
                                Text("Elenco")
                                Spacer()
                                Text("Promemoria")
                                    .foregroundColor(.secondary)
                            }
                            
                        } icon: {
                            Image(systemName: "list.bullet.circle.fill")
                                .font(.title2)
                                .foregroundColor(Color.orange)
                        }
                    }
                    
                }
                
                
            }            .toolbar {
                ToolbarItem(placement:.cancellationAction ) {
                    Button(action: {isPresented = false}, label: {
                        Text("Annulla")
                            .font(.headline)
                            .fontWeight(.medium)
                    })
                }
                
                
                
                ToolbarItem(placement:.principal ) {
                    
                    Text("Nuovo Promemoria")
                        .font(.headline)
                        .fontWeight(.bold)
                    
                }
                
                ToolbarItem(placement:.confirmationAction ) {
                    Button(action: {
                        let reminder = Reminder(titolo: titolo, note: note)
                       modelContext.insert(reminder)
                        isPresented = false
                        
                    }, label: {
                        Text("Aggiungi")
                            .font(.headline)
                            .fontWeight(.bold)
                    }).disabled(titolo.isEmpty)
                }
                
            }
            
            
            
            
            
            
            
        }
        
        
    }
    
    
    
     
    
}


#Preview {
 
     newReminderView(isPresented: .constant(true))
}
