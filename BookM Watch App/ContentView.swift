//
//  ContentView.swift
//  BookM Watch App
//
//  Created by miguel on 31/8/25.
//

import SwiftUI
import WidgetKit

extension ShapeStyle {
    static var mainColor: Color {
        Color(red: 0.96, green: 0.78, blue: 0.20)
    }
}

struct Book: Identifiable, Codable {
    var id = UUID()
    let title: String
    let author: String
    var pageRead: Int
    var totalPages: Int
    var isReading: Bool = false
}

@Observable class Books {
    private var _books = [Book]()

    var books: [Book] {
        get { _books }
        set {
            _books = newValue.sorted { $0.isReading && !$1.isReading }
            
            if let encoded = try? JSONEncoder().encode(_books) {
                UserDefaults(suiteName: "group.com.slvnn.BookM")!
                    .set(encoded, forKey: "books")
            }
        }
    }
    
    init() {
        let defaults = UserDefaults(suiteName: "group.com.slvnn.BookM")!
        if let savedItems = defaults.data(forKey: "books") {
            if let decoded = try? JSONDecoder().decode([Book].self, from: savedItems) {
                books = decoded
                return
            }
        }
    }
        
}


struct ContentView: View {
    @State private var books = Books()
    
    var body: some View {
        NavigationStack {
            List {
                NavigationLink(destination: AddBookView(books: books)) {
                    Image(systemName: "plus")
                        .bold()
                    Text("Add New Book")
                        .bold()
                }
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.roundedRectangle)
                
                ForEach($books.books) { $book in
                    NavigationLink(destination: DetailBookView(book: $book, books: $books.books)) {
                        ListBookView(book: book)
                    }
                    .padding(.vertical)
                    .clipped()
                }
                .onDelete(perform: deleteBooks)
                
            }
            .navigationTitle("BookM")
        }
        .background {
            LinearGradient(
                colors: [.mainColor.opacity(0.4), .mainColor.opacity(0.2)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            ).ignoresSafeArea()
        }
        
    }
    
    func deleteBooks(at offsets: IndexSet) {
        books.books.remove(atOffsets: offsets)
        WidgetCenter.shared.reloadAllTimelines()
    }
}

#Preview {
    ContentView()
}
