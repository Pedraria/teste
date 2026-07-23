import SwiftUI
import SwiftData

struct DetalhesTerritorioView: View {
    @Bindable var territorio: Territorio
    @Environment(\.modelContext) private var modelContext

    var body: some View {
        List {
            Section(header: Text("Informações")) {
                Text(territorio.descricao.isEmpty ? "Sem descrição" : territorio.descricao)
                    .foregroundColor(.secondary)
            }

            Section(header: Text("Cartões de Território")) {
                if territorio.cartoes.isEmpty {
                    Text("Nenhum cartão cadastrado.")
                        .italic()
                        .foregroundColor(.gray)
                } else {
                    ForEach(territorios_cartoes) { cartao in
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Cartão \(cartao.numero)")
                                    .font(.headline)
                                Text("Status: \(cartao.status)")
                                    .font(.caption)
                            }
                            Spacer()
                        }
                    }
                }
            }
        }
        .navigationTitle("Território \(territorio.numero)")
    }

    private var territorios_cartoes: [Cartao] {
        territorio.cartoes.sorted(by: { $0.numero < $1.numero })
    }
}
