# Fake Cash - iOS App

A pixel-perfect replica of the Cash App Money screen built with SwiftUI.

## Requirements
- Xcode 15+
- iOS 16+ deployment target
- macOS with Xcode installed

## How to Build & Run

1. Open `FakeCash.xcodeproj` in Xcode
2. Select your Team in Signing & Capabilities (or use Personal Team)
3. Choose a Simulator or connected device
4. Press ▶ Run (Cmd+R)

## Features
- ✅ Pixel-perfect Cash App Money screen
- ✅ Full scroll up/down
- ✅ Tap card chip to interact
- ✅ Edit all account details:
  - Balance amount
  - Cashtag / card name
  - Card last 4 digits
  - Account last 4 digits
  - Profile emoji
  - Green status text
  - Notification badge count
- ✅ Add money / Withdraw buttons
- ✅ Green status banner
- ✅ More for you section (Bitcoin, Paychecks, Savings, Stocks, Pools)
- ✅ Add money section (Direct deposit, Wire transfer, Paper money, Check, Auto reload)
- ✅ FDIC disclosure text
- ✅ Bottom tab bar with balance counter

## How to Edit Values
Tap the **profile avatar** (top right) to open the Edit Account sheet.
All values update live on screen.

## Files
- `FakeCashApp.swift` — App entry point
- `ContentView.swift` — Root view with tab bar
- `AccountModel.swift` — Observable data model
- `MoneyView.swift` — Main scrollable UI (all sections)
- `EditAccountSheet.swift` — Edit modal form
- `Extensions.swift` — Color(hex:) and corner radius helpers
