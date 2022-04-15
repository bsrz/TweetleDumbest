import ComposableArchitecture
import SwiftUI

@main
struct App: SwiftUI.App {

    @UIApplicationDelegateAdaptor private var delegate: AppDelegate

    var body: some Scene {
        WindowGroup {
            RootView(
                store: .init(
                    initialState: delegate.state,
                    reducer: AppDomain.reducer,
                    environment: .init()
                )
            )
        }
    }
}

class AppDelegate: NSObject, ObservableObject, UIApplicationDelegate {

    private(set) var state: AppDomain.State = .authentication(.init(isLoggedIn: false))

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {

        return true
    }
}
