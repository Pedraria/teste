import SwiftUI
import SwiftData

struct DetalhesTerritorioView: View {
    @Bindable var territorio: Territorio
    @Environment(\.modelContext) private var modelContext
    @State private var mostrandoNovoCartao = false

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
                    ForEach(territorio.cartoes.sorted(by: { $0.numero < $1.numero })) { cartao in
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Cartão \(cartao.numero)")
                                    .font(.headline)
                                Text("Status: \(cartao.status)")
                                    .font(.caption)
                                    .foregroundColor(corPorStatus(cartao.status))
                            }
                            Spacer()
                        }
                    }
                }
            }
        }
        .navigationTitle("Território \(territorio.numero)")
        .toolbar {
            Button("Novo Cartão") {
                mostrandoNovoCartao = true
            }
        }
        .sheet(isPresented: $mostrandoNovoCartao) {
            NovoCartaoView(territorio: territorio)
        }
    }

    private func corPorStatus(_ status: String) -> Color {
        switch status {
        case "Disponível": return .green
        case "Trabalhando": return .orange
        case "Concluído": return .blue
        default: return .primary
        }
    }
}
