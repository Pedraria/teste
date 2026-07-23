import SwiftUI
import SwiftData

struct DashboardView: View {
    @Query(sort: \Territorio.numero) private var territorios: [Territorio]
    @Environment(\.modelContext) private var modelContext
    @State private var mostrandoNovoTerritorio = false

    var body: some View {
        NavigationStack {
            List {
                if territorios.isEmpty {
                    ContentUnavailableView(
                        "Nenhum Território",
                        systemImage: "map",
                        description: Text("Toque no botão + para adicionar um novo território.")
                    )
                } else {
                    ForEach(territorios) { territorio in
                        NavigationLink(destination: DetalhesTerritorioView(territorio: territorio)) {
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Território \(territorio.numero) - \(territorio.nome)")
                                    .font(.headline)
                                Text("\(territorio.cartoes.count) cartão(ões)")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                    .onDelete(perform: deletarTerritorio)
                }
            }
            .navigationTitle("Territórios")
            .toolbar {
                Button(action: { mostrandoNovoTerritorio = true }) {
                    Label("Novo Território", systemImage: "plus")
                }
            }
            .sheet(isPresented: $mostrandoNovoTerritorio) {
                NovoTerritorioView()
            }
        }
    }

    private func deletarTerritorio(offsets: IndexSet) {
        for index in offsets {
            modelContext.delete(territorios[index])
        }
    }
}
