//
//  PromemoriaView.swift
//  reminder
//
//  Created by Enrico Madonna on 14/11/23.
//

import SwiftUI
import SwiftData
struct PromemoriaView: View {
    @Binding var isPresented:Bool

    @Query var reminders: [Reminder]
    @Environment(\.modelContext) var modelContext
    var body: some View {
        
         
            
        // (2)
        
        NavigationStack{
            ScrollView{
                VStack(alignment: .leading) {
                    
                    ForEach (self.reminders) { reminder in // (3)
                        TaskCell(reminder: reminder) // (6)
                    }
                    .onDelete { indexSet in // (4)
                        // The rest of this function will be added later
                    }
                    
                }
                
                .toolbar {
                    
                
                    
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
                        Spacer()
                    })
                    
                    
                }
                
             }
           
           
         }

        .navigationTitle("Tutti")
            //.onDelete(perform: deleteDestinations)
        }
}

#Preview {
    PromemoriaView(isPresented: .constant(false))
}



struct TaskCell: View {
  var reminder: Reminder
  
  var body: some View {
    HStack {
        Image(systemName: reminder.completato ? "checkmark.circle.fill" : "circle")
        .resizable()
        .foregroundStyle(Color.gray)
        .frame(width: 23, height: 23)
      Text(reminder.titolo)
             .padding(.leading, 5.0)
        Spacer()
    }
    .padding(.leading)

      Divider()
          .padding(.leading, 45.0)
          .padding([.top,.bottom],4)
      
   }
}
 
