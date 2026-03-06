import SwiftUI

struct ContentView: View {
    @StateObject var account = AccountModel()
    @State private var selectedTab: Int = 0

    var body: some View {
        ZStack(alignment: .bottom) {
            MoneyView(account: account)
                .ignoresSafeArea()

            BottomTabBar(account: account, selectedTab: $selectedTab)
        }
        .ignoresSafeArea(edges: .bottom)
    }
}
