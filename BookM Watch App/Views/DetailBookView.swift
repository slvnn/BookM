//
//  EditBookView.swift
//  BookM Watch App
//
//  Created by miguel on 31/8/25.
//

import SwiftUI
import WidgetKit

struct DetailBookView: View {
    @Binding var book: Book
    @Binding var books: [Book]
    @State private var showingEditPages = false
    
    var body: some View {
        List {
            Section {
                VStack(alignment: .leading) {
                    Text(book.title)
                        .font(.headline)
                    Text("by \(book.author)")
                        .font(.subheadline)
                }
                .padding(.vertical)
        
                HStack(spacing: 15) {
                    ZStack {
                        Text("\((book.pageRead * 100) / book.totalPages)%")
                            .font(.subheadline)
                            .bold()
                        
                        ProgressView(value: Double(book.pageRead), total: Double(book.totalPages))
                            .tint(.mainColor)
                            .progressViewStyle(.circular)
                    }
                    
                    Text("\(book.pageRead) of \(book.totalPages) pages read")
                }
                .padding(.vertical)
            }
                        
            Section {
                Button("Change Progress") {
                    showingEditPages = true
                }
                .buttonStyle(.bordered)

                HStack {
                    if book.isReading {
                        HStack {
                            Button {
                                book.isReading.toggle()
                                WidgetCenter.shared.reloadAllTimelines()
                            } label: {
                                Image(systemName: "book")
                            }
                            .tint(.red)
                            .buttonStyle(.bordered)
                            
                            Button {
                                book.pageRead = book.totalPages
                                book.isReading = false
                            } label: {
                                Image(systemName: "checkmark.seal.fill")
                            }
                            .buttonStyle(.bordered)
                            .tint(.green)
                        }
                        .padding(.horizontal)
                    } else {
                        Button {
                            setCurrentlyReading(bookID: book.id)
                            WidgetCenter.shared.reloadAllTimelines()
                        } label: {
                            Text("Now Reading")
                        }
                        .buttonStyle(.bordered)
                    }
                }
            }
            .listRowBackground(Color.clear)
        }
        .sheet(isPresented: $showingEditPages) {
            EditBookPagesView(book: $book)
        }
    }
    
    private func setCurrentlyReading(bookID: UUID) {
        for i in books.indices {
            books[i].isReading = (books[i].id == bookID)
        }
        WidgetCenter.shared.reloadAllTimelines()
    }
}

#Preview {
    DetailBookView(book: .constant(Book(title: "Sample Book", author: "Author", pageRead: 50, totalPages: 100, isReading: true)), books: .constant([]))
}
