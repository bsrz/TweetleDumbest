import ComposableArchitecture
import SwiftUI

struct AuthView: View {

    let store: Store<AuthDomain.State, AuthDomain.Action>

    var body: some View {
        WithViewStore(store) { viewStore in
            VStack {
                Text("Logged In: \(viewStore.isLoggedIn ? "yes" : "no")")
                Button {
                    viewStore.send(.logIn)
                } label: {
                    Text("Log In")
                        .background(.brown)
                        .foregroundColor(.white)
                }
            }
        }
    }
}
