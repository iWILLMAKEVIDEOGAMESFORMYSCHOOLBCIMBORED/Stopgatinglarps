import SwiftUI

struct EditAccountSheet: View {
    @ObservedObject var account: AccountModel
    @Environment(\.dismiss) var dismiss

    @State private var balanceText: String = ""
    @State private var cashtag: String = ""
    @State private var cardLast4: String = ""
    @State private var accountLast4: String = ""
    @State private var profileEmoji: String = ""
    @State private var greenStatus: String = ""
    @State private var notifications: String = ""

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("💰 Balance")) {
                    TextField("Balance (e.g. 24.85)", text: $balanceText)
                        .keyboardType(.decimalPad)
                }

                Section(header: Text("💳 Card")) {
                    TextField("Cashtag (e.g. $1xorfee)", text: $cashtag)
                    TextField("Card last 4 digits", text: $cardLast4)
                        .keyboardType(.numberPad)
                    TextField("Account last 4 digits", text: $accountLast4)
                        .keyboardType(.numberPad)
                }

                Section(header: Text("🎨 Profile")) {
                    TextField("Profile Emoji", text: $profileEmoji)
                    TextField("Green Status Text", text: $greenStatus)
                    TextField("Notification Count (number)", text: $notifications)
                        .keyboardType(.numberPad)
                }

                Section {
                    Button(action: save) {
                        HStack {
                            Spacer()
                            Text("Save Changes")
                                .font(.system(size: 17, weight: .bold))
                                .foregroundColor(.white)
                            Spacer()
                        }
                        .padding(.vertical, 4)
                    }
                    .listRowBackground(Color(hex: "00D632"))
                }
            }
            .navigationTitle("Edit Account")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") { dismiss() }
                }
            }
        }
        .onAppear {
            balanceText = String(format: "%.2f", account.balance)
            cashtag = account.cashtag
            cardLast4 = account.cardLastFour
            accountLast4 = account.accountLastFour
            profileEmoji = account.profileEmoji
            greenStatus = account.greenStatusText
            notifications = "\(account.notificationCount)"
        }
    }

    func save() {
        if let val = Double(balanceText) { account.balance = val }
        if !cashtag.isEmpty { account.cashtag = cashtag }
        if cardLast4.count == 4 { account.cardLastFour = cardLast4 }
        if accountLast4.count == 4 { account.accountLastFour = accountLast4 }
        if !profileEmoji.isEmpty { account.profileEmoji = profileEmoji }
        if !greenStatus.isEmpty { account.greenStatusText = greenStatus }
        if let n = Int(notifications) { account.notificationCount = n }
        dismiss()
    }
}
