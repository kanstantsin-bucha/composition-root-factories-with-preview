import OSLogs
import SwiftUI

@Observable
class ErrorAlertModel {
    var isPresented = false
    private var currentError: Error?

    func content() -> Alert {
        .init(
            title: Text("Error", bundle: .module),
            message: currentError.map { Text(message(error: $0)) }
        )
    }

    init() {}

    func show(error: Error) async {
        Logs.ui.log("error: \(error)")
        currentError = error
        if isPresented {
            isPresented = false
            /// We should wait until the previous alert hides
            try? await Task.sleep(for: .seconds(1))
        }
        isPresented = true
    }

    private func message(error: Error) -> String {
        var message = ""
        if let localizedError = error as? LocalizedError,
           let description = localizedError.errorDescription {
            message += description
            if let recovery = localizedError.recoverySuggestion {
                message += "\n" + recovery
            }
        } else {
            message = error.localizedDescription
        }
        return message
    }
}
