import SwiftUI
import OSLogs
/// Use Factory to inject the factory closures into the SwiftUI views during initialization.
/// As SwiftUI view init will be called only if there is no view,
///  or parameters that passed into the init differs from the previous one.
///
/// Any Factory instance should avoid to be not equal to the any other instance of the factory.
/// Because Factory do not pass the state across the app,
///  it is only pass the way to build child views using a local view state.
///
/// That way we will skip unnecessary redraws and the hierarchy of SwiftUI views will work smoother.
///
/// Factory caches the content and even if ``create`` called multiple times,
/// the content instance will be created only once,
/// all other calls will lead to the same instance being returned

class Factory<Content>: Equatable {

    typealias Creator = @MainActor () -> Content
    private(set) var create: Creator = { preconditionFailure() }

    init(closure: @escaping Creator) {
        create = {
            let instance = closure()
            Logs.main.log("replaced the create closure with the instance of \(type(of: instance))")
            // replace creator with the created instance
            self.create = { instance }
            return instance
        }
    }

    static func == (lhs: Factory, rhs: Factory) -> Bool { true }
}

class ParamsFactory<Content, Params: Equatable>: Equatable {

    typealias Creator = @MainActor (Params) -> Content
    private(set) var create: Creator = { _ in preconditionFailure() }
    private var cachedContent: Content?
    private var cachedParams: Params?

    init(closure: @escaping Creator) {
        create = { params in
            self.cachedParams = params
            var instance: Content
            if (params == self.cachedParams && self.cachedContent != nil) {
                instance = self.cachedContent!
            } else {
                instance = closure(params)
                self.cachedContent = instance
            }
            Logs.main.log("cache the instance of \(type(of: instance)) with \(params)")
            return instance
        }
    }

    static func == (lhs: ParamsFactory<Content, Params>, rhs: ParamsFactory<Content, Params>) -> Bool { true }
}


