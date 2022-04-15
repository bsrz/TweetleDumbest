import ComposableArchitecture

enum AuthDomain {
    struct State: Equatable {
        var isLoggedIn = false
    }

    enum Action {
        case logIn
    }

    struct Environment {
    }

    static let reducer: Reducer<State, Action, Environment> = .init { state, action, env in
        return .none
    }
}
