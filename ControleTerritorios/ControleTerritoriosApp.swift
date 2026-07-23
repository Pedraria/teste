import SwiftUI
import SwiftData

@main
struct ControleTerritoriosApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Territorio.self,
            Cartao.self,
            RegistroEntrega.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Não foi possível criar o ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            DashboardView()
        }
        .modelContainer(sharedModelContainer)
    }
}
