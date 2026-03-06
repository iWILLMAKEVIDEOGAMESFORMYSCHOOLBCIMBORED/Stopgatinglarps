import Foundation

class AccountModel: ObservableObject {
    @Published var balance: Double = 24.85
    @Published var cardLastFour: String = "2367"
    @Published var accountLastFour: String = "9890"
    @Published var cashtag: String = "$1xorfee"
    @Published var profileEmoji: String = "🌍"
    @Published var greenStatusText: String = "In progress"
    @Published var notificationCount: Int = 1

    var balanceDisplay: String {
        String(format: "$%.2f", balance)
    }

    var balanceRounded: String {
        "$\(Int(balance))"
    }
}
