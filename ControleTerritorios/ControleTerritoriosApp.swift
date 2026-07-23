import SwiftUI
import SwiftData

@main
struct ControleTerritoriosApp: App {
    var body: some Scene {
        WindowGroup {
            DashboardView()
        }
        .modelContainer(for: [Territorio.self, Cartao.self, RegistroEntrega.self])
    }
}
