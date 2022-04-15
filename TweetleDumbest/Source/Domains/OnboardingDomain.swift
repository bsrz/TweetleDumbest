import ComposableArchitecture

enum OnboardingDomain {
    struct State: Equatable {
        var isOnboarded = false
    }

    enum Action {
        case onboard
    }

    struct Environment {
    }

    static let reducer: Reducer<State, Action, Environment> = .init { state, action, env in
        return .none
    }
}
