import SwiftUI
import OSLogs

@MainActor
class CompositionRoot { // swiftlint:disable:this type_body_length

    static let shared = CompositionRoot()

    private let homeNavigation: HomeView.NavigationModel
    private let errorAlertModel = ErrorAlertModel()
    private let itemsRepository = ItemsRepository()
    private let settingRepository = SettingRepository()

    private init() {
        Logs.main.log("init: composition root")
        self.homeNavigation = .init()
    }

    // MARK: - Handle Phase

    func onScenePhaseChanged(old: ScenePhase, new: ScenePhase) {
        guard old != new else { return }
        Logs.main.log("app phase: \(new)")
        switch new {
        case .background:
            becameBackground()
        case .active, .inactive:
            /// the foreground transition is from `background` to `active`/`inactive`
            if old == .background {
                becameForeground()
            }
        @unknown default:
            Logs.main.error("got unknown case of scenePhase: \(new)")
        }
    }

    private func becameForeground() {}

    private func becameBackground() {}

    // MARK: - Window Views

    var homeViewFactory: Factory<HomeView> {
        .init {
            .init(
                navigationModel: self.homeNavigation,
                errorAlertModel: self.errorAlertModel,
                modelFactory: self.homeViewModelFactory
            )
        }
    }

    // MARK: - Window View Models

    var homeViewModelFactory: Factory<HomeView.Model> {
        .init {
            .init(
                repository: self.itemsRepository,
                settings: self.settingRepository
            )
        }
    }
}
