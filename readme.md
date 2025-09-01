# BookM Watch App & Widget

BookM is a simple and elegant Apple Watch app for tracking your reading progress. Add books, update pages read, and see your current book at a glance with a companion widget.

## Features

- 📚 Add, edit, and delete books
- ⏳ Track pages read and total pages
- 🔖 Mark a book as "Currently Reading"
- ✅ Mark books as completed
- 🟡 Beautiful progress indicators
- 🕰️ WatchOS widget shows your current book and progress

## Screenshots

*(Add screenshots here if available)*

## Installation

1. **Clone the repository:**
   ```sh
   git clone https://github.com/yourusername/BookM.git
   ```

2. **Open in Xcode:**
   - Open `BookM.xcodeproj` in Xcode.

3. **Configure App Group:**
   - Ensure the App Group identifier (`group.com.slvnn.BookM`) matches your Apple Developer account.
   - Update entitlements if needed.

4. **Build & Run:**
   - Select the Watch App target and run on a simulator or device.

## Widget Setup

- The widget reads your "Currently Reading" book from shared UserDefaults.
- Add the widget to your Apple Watch face for quick access.

## Project Structure

```
BookM WidgetExtension.entitlements
readme.md
BookM Watch App/
    BookM Watch App.entitlements
    BookMApp.swift
    ContentView.swift
    Assets.xcassets/
        Contents.json
        AccentColor.colorset/
            Contents.json
        AppIcon.appiconset/
            BOOK-1.jpg
            Contents.json
    Views/
        AddBookView.swift
        DetailBookView.swift
        EditBookPagesView.swift
        CustomViews/
            ListBookView.swift
BookM Widget/
    BookM_Widget.swift
    Info.plist
    Assets.xcassets/
        Contents.json
        AccentColor.colorset/
            Contents.json
        AppIcon.appiconset/
            Contents.json
        WidgetBackground.colorset/
            Contents.json
BookM.xcodeproj/
    project.pbxproj
    project.xcworkspace/
        contents.xcworkspacedata
        xcshareddata/
            swiftpm/
                Package.resolved
                configuration/
        xcuserdata/
            miguel.xcuserdatad/
                UserInterfaceState.xcuserstate
    xcuserdata/
        miguel.xcuserdatad/
            xcschemes/
                xcschememanagement.plist
```

## Dependencies

- [SwiftUI](https://developer.apple.com/xcode/swiftui/)
- [WidgetKit](https://developer.apple.com/documentation/widgetkit)
- [SwiftUI_Apple_Watch_Decimal_Pad](https://github.com/slvnn/SwiftUI_Apple_Watch_Decimal_Pad) *(for numeric input)*

## Customization

- Change the main color in `ShapeStyle.mainColor` for your own branding.
- Update the App Group identifier for your team.

## Contributing

Pull requests are welcome! For major changes, please open an issue first to discuss what you’d like to change.

## License

MIT License. See [LICENSE](LICENSE) for details.
