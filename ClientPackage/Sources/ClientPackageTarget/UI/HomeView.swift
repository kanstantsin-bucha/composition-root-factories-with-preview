import SwiftUI
import OSLogs

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
        Logs.main.log("HomeView: init")
        self.navigationModel = navigationModel
        self.errorAlertModel = errorAlertModel
        _model = State(initialValue: modelFactory.create())
    }

    public var body: some View {
        VStack {
            Text("Anime List")
                .font(.largeTitle)
            ScrollView {
                ForEach(model.animeList) { item in
                    VStack {
                        AsyncImage(url: URL(string: item.images.jpg.url))
                        Text(item.title)
                            .font(.headline)
                        Spacer(minLength: 4)
                        Text(item.japaneseTitle)
                        Text(item.status)
                        Text(String(item.score))
                        Spacer(minLength: 8)
                    }
                    .padding()
                }
            }
        }
        .padding()
        .task {
            await model.load()
        }
    }
}

extension HomeView {

    @MainActor
    @Observable
    final class Model {

        private let repository: AnimeRepository
        private let settings: SettingRepository
        
        private(set) var animeList: [AnimeListItem] = []

        init(
            repository: AnimeRepository,
            settings: SettingRepository
        ) {
            self.repository = repository
            self.settings = settings
        }
        
        func load() async {
            Logs.ui.log("Loading anime list")
            do {
                animeList = try await repository.getAnime()
            } catch {
                Logs.ui.error("Failed to load anime: \(error)")
            }
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
