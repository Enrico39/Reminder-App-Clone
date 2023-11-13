//
//  newReminderView.swift
//  reminder
//
//  Created by Enrico Madonna on 13/11/23.
//

import SwiftUI

struct newReminderView: View {
    
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
                    NavigationLink("Elenco") {
                        
                        comingSoonView()
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
                    Button(action: {}, label: {
                        Text("Aggiungi")
                            .font(.headline)
                            .fontWeight(.bold)
                    })
                }
                
            }
            
            
            
            
            HStack {
                Button(action: {}, label: {
                    Text("Annulla")
                        
                })
                
                Text("Nuovo promemoria")
                    .fontWeight(.semibold)
                    .lineLimit(1)
                    .padding(40)
                Button(action: {}, label: {
                    Text("Aggiungi")
                        .fontWeight(.semibold)
                })
            }
            
            
        }
        
        
    }
    
}


#Preview {
    newReminderView(isPresented: .constant(true))
}
