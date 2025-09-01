//
//  AddBookView.swift
//  BookM
//
//  Created by miguel on 31/8/25.
//

import SwiftUI
import SwiftUI_Apple_Watch_Decimal_Pad

struct AddBookView: View {
    @Environment(\.dismiss) var dismiss
    @State private var title = ""
    @State private var author = ""
    @State private var pageRead = ""
    @State private var totalPages = ""
    @Bindable var books: Books
    
    @State private var showingDecimalPad = false

    var body: some View {
        Form {
            Section(header: Text("Book Details")) {
                TextField("Title", text: $title)
                TextField("Author", text: $author)
                DigiTextView(placeholder: "Pages Read",
                    text: $pageRead,
                    presentingModal: showingDecimalPad
                )
                DigiTextView(placeholder: "Total Pages",
                    text: $totalPages,
                    presentingModal: showingDecimalPad
                )
            }
            
            Button("Add Book") {
                guard let pageReadInt = Int(pageRead), let totalPagesInt = Int(totalPages) else { return }
                let newBook = Book(title: title, author: author, pageRead: pageReadInt, totalPages: totalPagesInt)
                books.books.append(newBook)
                dismiss()
            }
            .disabled(title.isEmpty || author.isEmpty || Int(pageRead) == nil || Int(totalPages) == nil)
        }
        .navigationTitle("Add New Book")
    }
}

