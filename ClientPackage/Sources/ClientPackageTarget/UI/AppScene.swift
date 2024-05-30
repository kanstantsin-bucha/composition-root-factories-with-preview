import OSLogs
import SwiftUI

@MainActor
public struct AppScene: Scene {
    /// Composition root should be a `@State` or shared singleton.
    /// I chose singleton to prevent any possibility of it being initialized several times
    private let compositionRoot: CompositionRoot = .shared

    @Environment(\.scenePhase) var scenePhase

    @MainActor
    public init() {}

    public var body: some Scene {
        WindowGroup {
            compositionRoot.homeViewFactory.create()
        }
        .onChange(of: scenePhase, compositionRoot.onScenePhaseChanged(old: new:))
    }
}
