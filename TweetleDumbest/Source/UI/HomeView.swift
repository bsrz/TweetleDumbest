import ComposableArchitecture
import SwiftUI

struct HomeView: View {

    let store: Store<HomeDomain.State, HomeDomain.Action>

    var body: some View {
        WithViewStore(store) { viewStore in
            VStack {
                Text(viewStore.title)
                Button("say hello") {
                    viewStore.send(.sayHello("Foo"))
                }
                Button("log out") {
                    viewStore.send(.logOut)
                }
            }
        }
    }
}
