//
//  EditBookPagesView.swift
//  BookM Watch App
//
//  Created by miguel on 31/8/25.
//

import SwiftUI
import WidgetKit
import SwiftUI_Apple_Watch_Decimal_Pad

struct EditBookPagesView: View {
    @Binding var book: Book
    @State private var showingDecimalPad = true
    @State private var pageRead = ""
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            DigiTextView(placeholder: "Pages Read",
                         text: $pageRead,
                         presentingModal: showingDecimalPad
            )
            
            Button("Update Progress") {
                if let pageReadInt = Int(pageRead), pageReadInt <= book.totalPages {
                    book.pageRead = pageReadInt
                }
                WidgetCenter.shared.reloadAllTimelines()
                dismiss()
            }
        }
    }
}
