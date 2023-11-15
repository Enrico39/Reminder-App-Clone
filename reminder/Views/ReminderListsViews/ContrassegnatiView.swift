//
//  PromemoriaView.swift
//  reminder
//
//  Created by Enrico Madonna on 14/11/23.
//

import SwiftUI
import SwiftData
struct ContrassegnatiView: View {
    
    
    
    @Binding var isPresented:Bool

    @Query var reminders: [Reminder]
    @Environment(\.modelContext) var modelContext
    var body: some View {
        
      
        // (2)
      
       /* HStack {
            Text("Tutti")
            Spacer()
            Text("\(reminders.count)")
        }
        .font(.system(.largeTitle, design: .rounded))
        .bold()
        .foregroundColor(Color.black)
        .padding(.horizontal)
        
        */
            List {
                
                ForEach (self.reminders) {
                    
                    
                    reminder in
                    if(reminder.contrassegnato == true && reminder.completato==false)
                    {
                        TaskCell(reminder: reminder)
                            .listRowBackground(Color.clear)
                            .listRowInsets(EdgeInsets())
                            .swipeActions {
                              
                                Button {
                                    withAnimation(.easeInOut(duration: 0.5)) {
                                        modelContext.delete(reminder)
                                    }
                                    
                                    print("Message deleted")
                                } label: {
                                    Label("Elimina", systemImage: "trash")
                                }
                                .tint(.red)
                                
                                
                                Button {
                                    withAnimation(.easeInOut(duration: 0.5)) {
                                        reminder.contrassegnato.toggle()
                                    }
                                    
                                    print("Message contrassegnato")
                                } label: {
                                    Label("Contrassegna", systemImage: "flag.fill")
                                }
                                .tint(.orange)
                            }
                    }
                }
                
                .navigationBarTitle("Contrassegnati", displayMode: .large)
          
                
            }
           
        
        
         


            //.onDelete(perform: deleteDestinations)
        
        
        }
}

#Preview {
    CompletatiView(isPresented: .constant(false))
}



 

