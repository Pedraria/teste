import SwiftUI

struct NovoTerritorioView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext

    @State private var numero = ""
    @State private var nome = ""
    @State private var descricao = ""

    var body: some View {
        NavigationStack {
            Form {
                TextField("Número do Território", text: $numero)
                    .keyboardType(.numberPad)
                TextField("Nome / Região", text: $nome)
                TextField("Descrição / Detalhes", text: $descricao)
            }
            .navigationTitle("Novo Território")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancelar") { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Salvar") {
                        if let num = Int(numero), !nome.isEmpty {
                            let novo = Territorio(numero: num, nome: nome, descricao: descricao)
                            modelContext.insert(novo)
                            dismiss()
                        }
                    }
                }
            }
        }
    }
}

struct NovoCartaoView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    var territorio: Territorio

    @State private var numeroCartao = ""

    var body: some View {
        NavigationStack {
            Form {
                TextField("Número do Cartão", text: $numeroCartao)
                    .keyboardType(.numberPad)
            }
            .navigationTitle("Novo Cartão")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancelar") { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Salvar") {
                        if let num = Int(numeroCartao) {
                            let novoCartao = Cartao(numero: num)
                            territorio.cartoes.append(novoCartao)
                            dismiss()
                        }
                    }
                }
            }
        }
    }
}
