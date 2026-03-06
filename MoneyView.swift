import SwiftUI

struct EditAccountSheet: View {
    @ObservedObject var account: AccountModel
    @Environment(\.dismiss) var dismiss

    @State private var balanceText = ""
    @State private var cashtag = ""
    @State private var cardLast4 = ""
    @State private var accountLast4 = ""
    @State private var profileEmoji = ""
    @State private var greenStatus = ""
    @State private var notifCount = ""

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("💰 Balance")) {
                    HStack {
                        Text("$")
                        TextField("e.g. 24.85", text: $balanceText)
                            .keyboardType(.decimalPad)
                    }
                }

                Section(header: Text("💳 Card Info")) {
                    HStack {
                        Text("Cashtag")
                        Spacer()
                        TextField("e.g. $1xorfee", text: $cashtag)
                            .multilineTextAlignment(.trailing)
                    }
                    HStack {
                        Text("Card last 4")
                        Spacer()
                        TextField("e.g. 2367", text: $cardLast4)
                            .keyboardType(.numberPad)
                            .multilineTextAlignment(.trailing)
                    }
                    HStack {
                        Text("Account last 4")
                        Spacer()
                        TextField("e.g. 9890", text: $accountLast4)
                            .keyboardType(.numberPad)
                            .multilineTextAlignment(.trailing)
                    }
                }

                Section(header: Text("🎨 Display")) {
                    HStack {
                        Text("Profile Emoji")
                        Spacer()
                        TextField("e.g. 🌍", text: $profileEmoji)
                            .multilineTextAlignment(.trailing)
                    }
                    HStack {
                        Text("Green Status")
                        Spacer()
                        TextField("e.g. In progress", text: $greenStatus)
                            .multilineTextAlignment(.trailing)
                    }
                    HStack {
                        Text("Notification Badge")
                        Spacer()
                        TextField("e.g. 1", text: $notifCount)
                            .keyboardType(.numberPad)
                            .multilineTextAlignment(.trailing)
                    }
                }

                Section {
                    Button(action: saveAndDismiss) {
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
        .onAppear(perform: loadValues)
    }

    func loadValues() {
        balanceText  = String(format: "%.2f", account.balance)
        cashtag      = account.cashtag
        cardLast4    = account.cardLastFour
        accountLast4 = account.accountLastFour
        profileEmoji = account.profileEmoji
        greenStatus  = account.greenStatusText
        notifCount   = "\(account.notificationCount)"
    }

    func saveAndDismiss() {
        if let v = Double(balanceText)    { account.balance = v }
        if !cashtag.isEmpty              { account.cashtag = cashtag }
        if cardLast4.count == 4          { account.cardLastFour = cardLast4 }
        if accountLast4.count == 4       { account.accountLastFour = accountLast4 }
        if !profileEmoji.isEmpty         { account.profileEmoji = profileEmoji }
        if !greenStatus.isEmpty          { account.greenStatusText = greenStatus }
        if let n = Int(notifCount)       { account.notificationCount = n }
        dismiss()
    }
}
