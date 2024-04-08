import OSLogs
import SwiftUI

enum AppNavigation {
    @MainActor @Observable class Model<NavigationItem: Hashable> {
        var homeNavigationPath = NavigationPath()

        /// Replaces the current top item with the item
        func show(item: NavigationItem) {
            Logs.ui.log("\(item)")
            if !homeNavigationPath.isEmpty {
                homeNavigationPath.removeLast()
            }
            homeNavigationPath.append(item)
        }

        func showNext(item: NavigationItem) {
            Logs.ui.log("\(item)")
            homeNavigationPath.append(item)
        }

        func goBack() {
            Logs.ui.log("")
            guard !homeNavigationPath.isEmpty else { return }
            homeNavigationPath.removeLast()
        }

        func goHome() {
            Logs.ui.log("")
            guard !homeNavigationPath.isEmpty else { return }
            homeNavigationPath.removeLast(homeNavigationPath.count)
        }
    }

    enum HomeNavigationItem: Hashable {
        case myAView(stencil: ItemData)
        case myBView(stencil: ItemData)
    }
}
