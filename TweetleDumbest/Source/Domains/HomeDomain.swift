import ComposableArchitecture

enum HomeDomain {
    struct State: Equatable {
        var title = "Home"
    }

    enum Action {
        case logOut
        case sayHello(String)
    }

    struct Environment {
    }

    static let reducer: Reducer<State, Action, Environment> = .init { state, action, env in
        switch action {
        case .sayHello(let string):
            state.title = string

        default: break
        }
        return .none
    }
}
