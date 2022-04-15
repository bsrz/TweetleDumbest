import ComposableArchitecture

enum AppDomain {
    enum State: Equatable {
        case authentication(AuthDomain.State)
        case onboarding(OnboardingDomain.State)
        case home(HomeDomain.State)
    }

    enum Action {
        case authentication(AuthDomain.Action)
        case onboarding(OnboardingDomain.Action)
        case home(HomeDomain.Action)
    }

    struct Environment {
    }

    static let reducer: Reducer<State, Action, Environment> = .combine(
        AuthDomain.reducer.pullback(
            state: /AppDomain.State.authentication,
            action: /AppDomain.Action.authentication,
            environment: { _ in AuthDomain.Environment() }
        ),
        HomeDomain.reducer.pullback(
            state: /AppDomain.State.home,
            action: /AppDomain.Action.home,
            environment: { _ in HomeDomain.Environment() }
        ),
        OnboardingDomain.reducer.pullback(
            state: /AppDomain.State.onboarding,
            action: /AppDomain.Action.onboarding,
            environment: { _ in OnboardingDomain.Environment()  }
        ),
        .init { state, action, env in
            switch action {
            case .authentication(.logIn):
                state = .home(.init())
                return .none

            case .onboarding:
                return .none

            case .home(.logOut):
                state = .authentication(.init())
                return .none

            default:
                return .none
            }
        }
    )
}
