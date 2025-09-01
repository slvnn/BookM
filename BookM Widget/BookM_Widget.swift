//
//  BookM_Widget.swift
//  BookM Widget
//
//  Created by miguel on 31/8/25.
//

import WidgetKit
import SwiftUI

// MARK: - Book model (must match your main app)
struct Book: Identifiable, Codable {
    var id = UUID()
    let title: String
    let author: String
    var pageRead: Int
    var totalPages: Int
    var isReading: Bool = false
}

// MARK: - Helper to read books from UserDefaults
struct WidgetBooks {
    static func currentBook() -> Book? {
        let defaults = UserDefaults(suiteName: "group.com.slvnn.BookM")!
        if let savedData = defaults.data(forKey: "books"),
           let decoded = try? JSONDecoder().decode([Book].self, from: savedData) {
            return decoded.first(where: { $0.isReading })
        }
        return nil
    }
}

// MARK: - Timeline entry
struct SimpleEntry: TimelineEntry {
    let date: Date
    let book: Book?
}

// MARK: - Timeline provider
struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), book: Book(title: "Sample Book", author: "Author", pageRead: 50, totalPages: 100, isReading: true))
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let book = WidgetBooks.currentBook()
        completion(SimpleEntry(date: Date(), book: book))
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<SimpleEntry>) -> ()) {
        let book = WidgetBooks.currentBook()
        let entry = SimpleEntry(date: Date(), book: book)
        let timeline = Timeline(entries: [entry], policy: .atEnd)
        completion(timeline)
    }
}

// MARK: - Widget view
struct BookM_WidgetEntryView: View {
    var entry: Provider.Entry

    var body: some View {
        VStack(alignment: .leading) {
            if let book = entry.book {
                HStack {
                    VStack(alignment: .leading) {
                        Text(book.title)
                            .bold()
                            .lineLimit(1)
                            .minimumScaleFactor(0.5)
                        Text(book.author)
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    
                    Spacer()
                    
                    if book.pageRead == book.totalPages {
                        Image(systemName: "checkmark.seal.fill")
                            .foregroundColor(.green)
                            .imageScale(.large)
                    } else {
                        Text(String(book.pageRead))
                    }
                }
                ProgressView(value: Double(book.pageRead) / Double(max(book.totalPages, 1)))
                    .progressViewStyle(.linear)
            } else {
                Text("No Book Reading")
                    .font(.headline)
            }
        }
        .padding()
    }
}

// MARK: - Widget main
@main
struct BookM_Widget: Widget {
    let kind: String = "BookM_Widget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            if #available(watchOS 10.0, *) {
                BookM_WidgetEntryView(entry: entry)
                    .containerBackground(.fill.tertiary, for: .widget)
            } else {
                BookM_WidgetEntryView(entry: entry)
                    .padding()
                    .background()
            }
        }
        .configurationDisplayName("BookM Widget")
        .description("Shows the book you are currently reading.")
    }
}

// MARK: - Preview
#Preview(as: .accessoryRectangular) {
    BookM_Widget()
} timeline: {
    SimpleEntry(date: .now, book: Book(title: "Maze Runner", author: "James Dashner", pageRead: 50, totalPages: 200, isReading: true))
}
