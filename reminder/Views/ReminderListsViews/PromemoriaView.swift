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
                    if(reminder.completato == false)
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
                
                .navigationBarTitle("Tutti", displayMode: .large)
          
                
            }
           
        
        
         


            //.onDelete(perform: deleteDestinations)
        
        
        }
}

#Preview {
    PromemoriaView(isPresented: .constant(false))
}


/*
struct TaskCell: View {
  var reminder: Reminder
    @State private var complete: Bool = false
    var body: some View {
        
        VStack(alignment:.leading){
            HStack {
                
                
                Button(action: 
                        {
                    complete.toggle()
                     
                        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                            if (complete==true){
                                // Codice da eseguire dopo 2 secondi
                                reminder.completato.toggle()
                                reminder.contrassegnato = false
                                print("toggoled")
                            }
                        
                    }
                    
                },
                       label: {
                    Image(systemName: complete ? "checkmark.circle.fill" : "circle")
                        .resizable()
                        .foregroundStyle(complete ? Color.blue : Color.gray)
                        .frame(width: 23, height: 23)})
                
                Text(reminder.titolo)
                    .padding(.leading, 5.0)
                Spacer()
                if(reminder.contrassegnato == true){
                    Image(systemName: "flag.fill")
                        .resizable()
                        .foregroundStyle(Color.orange)
                        .frame(width: 17, height: 17)
                        .padding(.horizontal)
                }
            }
            
            
            .padding(.leading)
            
            if(!reminder.note.isEmpty){
                Text(reminder.note)
                    .font(.caption)
                    .foregroundColor(Color.gray)
                    .padding(.leading, 50.0)
                Spacer()
            }
            
            //Divider()
            //   .padding(.leading, 45.0)
            //  .padding([.top,.bottom],4)
            
        }
    }
}
  

*/
