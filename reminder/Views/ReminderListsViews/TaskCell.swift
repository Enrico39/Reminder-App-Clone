//
//  TaskCell.swift
//  reminder
//
//  Created by Enrico Madonna on 15/11/23.
//

import SwiftUI

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
                      Image(systemName: complete ? "circle.inset.filled" : "circle")
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
                          .padding(.top,7)
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
            
          }
      }
}
 
