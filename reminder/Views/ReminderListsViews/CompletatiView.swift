//
//  PromemoriaView.swift
//  reminder
//
//  Created by Enrico Madonna on 14/11/23.
//

import SwiftUI
import SwiftData

struct CompletatiView: View {
    @Binding var isPresented:Bool

    @Query var reminders: [Reminder]
    @Environment(\.modelContext) var modelContext
    var body: some View {
        
      
          
            
                List {
                    HStack{
                        Text("\(reminders.filter { $0.completato }.count) completati • ")
                            .foregroundColor(Color.gray)
                        Button("Elimina"){
                            eliminaRemindersCompletati()
                            
                        }
                        .disabled(reminders.filter { $0.completato }.count==0)
                        Spacer()
                    }
                    .listRowBackground(Color.clear)
                    .listRowInsets(EdgeInsets())
                        .padding(.vertical)
                  
                    
                ForEach (self.reminders) {
                    
                    reminder in
                    if(reminder.completato == true)
                    {
                        CompletedTaskCell(reminder: reminder)
                            .listRowBackground(Color.clear)
                            .listRowInsets(EdgeInsets())
                            .swipeActions {
                                
                                Button {
                                
                                    
                                    withAnimation {
                                        modelContext.delete(reminder)                                                                }
                                    
                                    print("Message deleted")
                                } label: {
                                    Label("Elimina", systemImage: "trash")
                                }
                                .tint(.red)
                                
                                
                            }
                    }
                }
                
             
                
            }
                
                .navigationBarTitle("Completati", displayMode: .large)
 
        
        }
    
    
    func eliminaRemindersCompletati() {
        let completati = reminders.filter { $0.completato }
        for reminder in completati {
            modelContext.delete(reminder)
        }
  
    }
}

#Preview {
    CompletatiView(isPresented: .constant(false))
}



 

