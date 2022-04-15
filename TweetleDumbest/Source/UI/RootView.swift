import ComposableArchitecture
import SwiftUI

struct RootView: View {

    let store: Store<AppDomain.State, AppDomain.Action>

    var body: some View {
        SwitchStore(store) {
            CaseLet(state: /AppDomain.State.authentication, action: AppDomain.Action.authentication) { authStore in
                AuthView(store: authStore)
            }
            CaseLet(state: /AppDomain.State.home, action: AppDomain.Action.home) { homeStore in
                HomeView(store: homeStore)
            }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView(
            store: .init(
                initialState: .authentication(.init(isLoggedIn: true)),
                reducer: AppDomain.reducer,
                environment: .init()
            )
        )
    }
}
