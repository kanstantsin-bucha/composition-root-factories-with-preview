import Foundation

struct ItemsRepository {

    func loadAppData() async throws -> [ItemData] {
        Self.appData
    }

    static var appData: [ItemData] {
        [
            .init(name: "1", description: "The First Item", compoundValue: 50.1),
            .init(name: "2", description: "The Second Item", compoundValue: 50.1),
            .init(name: "3", description: "The Third Item", compoundValue: 50.1),
        ]
    }
}
