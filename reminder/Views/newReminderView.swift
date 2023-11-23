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
        NavigationView {
            List {
                Section {
                    TextField("Titolo", text: $titolo, axis: .vertical)
                        .lineLimit(5)
                        .focused($isFocused)
                        .onAppear { self.isFocused = true }
                        .accessibilityLabel("Inserisci il titolo del promemoria")
                        .accessibilityHint("Questo campo è per il titolo del tuo promemoria")

                    TextField("Note", text: $note, axis: .vertical)
                        .lineLimit(4...8)
                        .accessibilityLabel("Inserisci le note per il promemoria")
                        .accessibilityHint("Questo campo è per aggiungere note al tuo promemoria")
                }

                Section {
                    NavigationLink("Dettagli") {
                        comingSoonView()
                    }
                    .accessibilityLabel("Vai ai dettagli del promemoria")
                }

                Section {
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
                    .accessibilityLabel("Vai all'elenco dei promemoria")
                }
            }
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button(action: { isPresented = false }) {
                        Text("Annulla")
                            .font(.headline)
                            .fontWeight(.medium)
                    }
                    .accessibilityLabel("Annulla la creazione di un nuovo promemoria")
                }

                ToolbarItem(placement: .principal) {
                    Text("Nuovo Promemoria")
                        .font(.headline)
                        .fontWeight(.bold)
                }

                ToolbarItem(placement: .confirmationAction) {
                    Button(action: {
                        let reminder = Reminder(titolo: titolo, note: note)
                        modelContext.insert(reminder)
                        isPresented = false
                    }) {
                        Text("Aggiungi")
                            .font(.headline)
                            .fontWeight(.bold)
                    }
                    .disabled(titolo.isEmpty)
                    .accessibilityLabel("Aggiungi il nuovo promemoria")
                }
            }
        }
    }
}

struct newReminderView_Previews: PreviewProvider {
    static var previews: some View {
        newReminderView(isPresented: .constant(true))
    }
}
