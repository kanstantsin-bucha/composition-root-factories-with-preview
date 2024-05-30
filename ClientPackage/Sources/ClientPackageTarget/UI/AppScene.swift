import OSLogs
import SwiftUI

@MainActor
public struct AppScene: Scene {
    /// Composition root should be a `@State` or shared singleton.
    /// I chose singleton to prevent any possibility of it being initialized several times
    private let compositionRoot: CompositionRoot = .shared
    private let homeViewFactory: Factory<HomeView>

    @Environment(\.scenePhase) var scenePhase

    @MainActor
    public init() {
        Logs.main.log("app scene: init")
        homeViewFactory = compositionRoot.homeViewFactory
    }

    public var body: some Scene {
        WindowGroup {
            VStack {
                {
                    // The closure introduced for the debug purposes only
                    Logs.main.log("app scene: load HomeView")
                    return homeViewFactory.create()
                }()
            }
            .task {
                try? await Task.sleep(nanoseconds: UInt64(10e6))
            }
        }
        .onChange(of: scenePhase, compositionRoot.onScenePhaseChanged(old: new:))
    }
}
