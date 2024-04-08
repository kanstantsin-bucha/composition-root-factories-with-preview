import SwiftUI

/// Use Factory to inject the factory closures into the SwiftUI views during initialization.
/// As SwiftUI view init does not lead to recreation of the view,
///  and that recreation happens only if the parameters we pass differs from the previous one
///  any Factory should avoid to be not equal to the previous instance of the factory.
///
/// That way we will skip unnecessary redraws and the hierarchy of SwiftUI views will work smoother.
///
/// It will work fine until you separate state from the UI. Views should not hold global or model state.
/// View should only hold the temporary state like hidden/visible subview, popup, alert and things like that.

class Factory<Content>: Equatable {

    typealias Creator = @MainActor () -> Content
    let create: Creator

    init(closure: @escaping Creator) {
        create = closure
    }

    static func == (lhs: Factory, rhs: Factory) -> Bool { true }
}

class ParamsFactory<Content, Params: Equatable>: Equatable {

    typealias Creator = @MainActor (Params) -> Content
    let create: Creator

    init(closure: @escaping Creator) {
        create = closure
    }

    static func == (lhs: ParamsFactory<Content, Params>, rhs: ParamsFactory<Content, Params>) -> Bool { true }
}
