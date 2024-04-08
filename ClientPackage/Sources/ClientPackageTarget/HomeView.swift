import SwiftUI

struct HomeView: View {
    typealias NavigationModel = AppNavigation.Model<AppNavigation.HomeNavigationItem>

    private let navigationModel: NavigationModel
    private let errorAlertModel: ErrorAlertModel
    @State private var model: HomeView.Model

    @MainActor
    init(
        navigationModel: NavigationModel,
        errorAlertModel: ErrorAlertModel,
        modelFactory: Factory<HomeView.Model>
    ) {
        self.navigationModel = navigationModel
        self.errorAlertModel = errorAlertModel
        _model = State(wrappedValue: modelFactory.create())
    }

    public var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Home View Template")
        }
        .padding()
    }
}

extension HomeView {

    @MainActor
    final class Model {

        private let repository: ItemsRepository
        private let settings: SettingRepository

        init(
            repository: ItemsRepository,
            settings: SettingRepository
        ) {
            self.repository = repository
            self.settings = settings
        }

    }
}

#if DEBUG

struct HomeViewPreview: PreviewProvider {
    static var previews: HomeView {
        PreviewCompositionRoot.preview.homeViewFactory.create()
    }
}

#endif
