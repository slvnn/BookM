<img src="Screenshots/icon.jpg" alt="icon" width="150">

# BookM - Reading Tracker & Digital Bookmark

BookM is a simple and elegant Apple Watch app for tracking your reading progress. Add books, update pages read, and see your current book at a glance with a companion widget that can replace physical bookmarks.

## Features

- 📚 Add, edit, and delete books
- ⏳ Track pages read and total pages
- 🕰️ WatchOS widget lets you quickly now what page you're at

## Screenshots

<img src="Screenshots/apple%20watch.png" alt="App in Apple Watch" >

## Installation

1. **Clone the repository:**
   ```sh
   git clone https://github.com/yourusername/BookM.git
   ```

2. **Open in Xcode:**
   - Open `BookM.xcodeproj` in Xcode.

3. **Configure App Group:**
   - Ensure the App Group identifier (`group.com.xxx.BookM`) matches your Apple Developer account.
   - Update entitlements if needed.

4. **Build & Run:**
   - Select the Watch App target and run on a simulator or device.

## Widget Setup

- The widget reads your "Currently Reading" book from shared UserDefaults.
- Add the widget to your Apple Watch Smart Stack for quick access.

## Project Structure

```
BookM Watch App/
    BookM Watch App.entitlements
    BookMApp.swift
    ContentView.swift
    Assets.xcassets
    Views/
        AddBookView.swift
        DetailBookView.swift
        EditBookPagesView.swift
        CustomViews/
            ListBookView.swift
BookM Widget/
    BookM_Widget.swift
    Info.plist
    Assets.xcassets
```

## Dependencies

- [SwiftUI](https://developer.apple.com/xcode/swiftui/)
- [WidgetKit](https://developer.apple.com/documentation/widgetkit)
- [SwiftUI_Apple_Watch_Decimal_Pad](https://github.com/slvnn/SwiftUI_Apple_Watch_Decimal_Pad) *(for numeric pad)*


## Contributing

Please, use this code as you please. Fork it, edit, customiza and make it YOUR OWN.

## License

MIT License. See [LICENSE](LICENSE) for details.
