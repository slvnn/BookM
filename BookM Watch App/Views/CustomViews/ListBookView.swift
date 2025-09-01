//
//  ListBookView.swift
//  BookM Watch App
//
//  Created by miguel on 31/8/25.
//

import SwiftUI

struct ListBookView: View {
    var book: Book
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text(book.title)
                    .font(.headline)
                Text("by \(book.author)")
                    .font(.subheadline)
            }
                
            Divider()
                .padding(.vertical, 4)
            
            if book.pageRead == book.totalPages {
                Text("Completed")
                    .font(.caption)
            } else {
                VStack {
                    Text("\(book.pageRead) of \(book.totalPages) pages read")
                        .font(.caption)
                        .lineLimit(1)
                    ProgressView(value: Double(book.pageRead), total: Double(book.totalPages))
                        .tint(.mainColor)
                }
            }
        }
        
        .overlay(alignment: .topTrailing) {
            if book.isReading {
                Image(systemName: "bookmark.fill")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.mainColor)
                    .frame(width: 20, height: 20)
                    .offset(y: -10)
            }
        }
    }
}

#Preview {
    ListBookView(book: Book(title: "Sample Book Title", author: "Author Name", pageRead: 150, totalPages: 300) )
}
