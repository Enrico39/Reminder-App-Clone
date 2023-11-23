//
//  cardsReminderView.swift
//  reminder
//
//  Created by Enrico Madonna on 14/11/23.
//

import SwiftUI
import SwiftData

struct cardsReminderView: View {
    @Binding var isPresented:Bool

    @Query var reminders: [Reminder]
    @Environment(\.modelContext) var modelContext
    let columns = [GridItem(.flexible(), spacing: 20), GridItem(.flexible(), spacing: 20)]
    var body: some View {
        
        
        
        ZStack {
            //Background Color
            Color(uiColor: .systemGroupedBackground)
                .ignoresSafeArea()
            
            VStack {
                LazyVGrid(columns: columns, spacing: 20) {
                    // TodayCardView(title: "Today", number: 0)
                 /*   CardView(systemImageName: "calendar.circle.fill", systemImageColor: .red, title: "Programmati", number:"2")
                    */
                    
                    
                    NavigationLink(destination: PromemoriaView(isPresented: $isPresented)){
                        
                        CardView(systemImageName: "tray.circle.fill", systemImageColor: .gray, title: "Tutti", number: String(reminders.filter { !$0.completato }.count))
                            //.accessibilityLabel("All reminders \(String(reminders.filter { !$0.completato }.count))")
                             .accessibilityHint("Double tap to see all reminders")
                            
                        
                     }
                    
                    NavigationLink(destination: ContrassegnatiView(isPresented: $isPresented)){
                        CardView(systemImageName: "flag.circle.fill", systemImageColor: .orange, title: "Contrassegnati", number: String(reminders.filter { $0.contrassegnato }.count))
                           // .accessibilityLabel("Contrassegnati \(String(reminders.filter { $0.contrassegnato }.count))")
                            .accessibilityHint("Double tap to see favourite reminders")
                     }
                    
                    
                    NavigationLink(destination: CompletatiView(isPresented: $isPresented)){
                        
                        CardView(systemImageName: "checkmark.circle.fill", systemImageColor: .teal, title: "Completati", number: "")
                        
                          //  .accessibilityLabel("Promemoria Completati")
                         .accessibilityHint("Double tap to see completed reminders")}
                }
                
                .padding()
                
             
                Spacer()
                
                //ELENCHI
                
               
                
                /*
                 List {
                 NavigationLink(destination: Text("iCloud")) {
                 Label {
                 HStack {
                 Text("iCloud")
                 Spacer()
                 Text("10")
                 .foregroundColor(.secondary)
                 }
                 
                 } icon: {
                 Image(systemName: "list.bullet.circle.fill")
                 .font(.title2)
                 .foregroundColor(Color.purple)
                 }
                 }
                 
                 
                 
                 
                 NavigationLink(destination: Text("Work")) {
                 Label {
                 HStack {
                 Text("Work")
                 Spacer()
                 Text("0")
                 .foregroundColor(.secondary)
                 }
                 
                 } icon: {
                 Image(systemName: "list.bullet.circle.fill")
                 .font(.title2)
                 .foregroundColor(Color.blue)
                 }
                 }
                 
                 NavigationLink(destination: Text("High Priority")) {
                 Label {
                 HStack {
                 Text("High Priority")
                 Spacer()
                 Text("7")
                 .foregroundColor(.secondary)
                 }
                 
                 } icon: {
                 Image(systemName: "exclamationmark.bubble.circle.fill")
                 .font(.title2)
                 .foregroundColor(Color.red)
                 }
                 }
                 }.listStyle(.sidebar)
                 
                 */
                
            }
            
        }
        
     
        
        
    }
    
    
    
}

#Preview {
    cardsReminderView(isPresented: .constant(false))
}


struct CardView: View {
    let systemImageName: String
    let systemImageColor: Color
    let title: String
    let number: String
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                ZStack {
                    Circle()
                        .frame(maxWidth: 30)
                        .foregroundStyle(.white)
                    Image(systemName: systemImageName)
                        .foregroundColor(systemImageColor)
                        .font(.largeTitle)
                    
                }
                Spacer()
                Text(number)
                    .font(.system(.title, design: .rounded))
                    .fontWeight(.bold)
                    .foregroundColor(Color.primary)
                    
            }
            .padding(.horizontal, 4.0)
            Text(title)
                .font(.system(.headline, design: .rounded))
                 .fontWeight(.semibold)
                .foregroundColor(.secondary)
                .padding([.leading, .bottom], 3.0)
            
        }
        .padding(5.0)
        .background(.fill)
        .cornerRadius(12)
    }
}


