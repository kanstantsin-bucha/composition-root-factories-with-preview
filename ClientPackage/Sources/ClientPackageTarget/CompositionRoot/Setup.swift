import OSLogs

extension Logs {
    static let ui = AppLogger(category: "ui") // the logs of UI logic
    static let repo = AppLogger(category: "repo") // the logs of Repositories logic
}

