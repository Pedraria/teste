import Foundation
import SwiftData

@Model
final class Territorio {
    @Attribute(.unique) var id: UUID
    var numero: Int
    var nome: String
    var descricao: String
    @Relationship(deleteRule: .cascade) var cartoes: [Cartao]

    init(numero: Int, nome: String, descricao: String = "", cartoes: [Cartao] = []) {
        self.id = UUID()
        self.numero = numero
        self.nome = nome
        self.descricao = descricao
        self.cartoes = cartoes
    }
}

@Model
final class Cartao {
    @Attribute(.unique) var id: UUID
    var numero: Int
    var status: String
    var dataUltimaAtribuicao: Date?
    @Relationship(deleteRule: .cascade) var entregas: [RegistroEntrega]

    init(numero: Int, status: String = "Disponível", dataUltimaAtribuicao: Date? = nil, entregas: [RegistroEntrega] = []) {
        self.id = UUID()
        self.numero = numero
        self.status = status
        self.dataUltimaAtribuicao = dataUltimaAtribuicao
        self.entregas = entregas
    }
}

@Model
final class RegistroEntrega {
    @Attribute(.unique) var id: UUID
    var nomePublicador: String
    var dataSaida: Date
    var dataDevolucao: Date?

    init(nomePublicador: String, dataSaida: Date = Date(), dataDevolucao: Date? = nil) {
        self.id = UUID()
        self.nomePublicador = nomePublicador
        self.dataSaida = dataSaida
        self.dataDevolucao = dataDevolucao
    }
}
