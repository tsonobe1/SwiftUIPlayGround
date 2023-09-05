//
//  NoteBookList.swift
//  SwiftUIPlayGround
//
//  Created by tsonobe on 2023/09/05.
//

import SwiftUI
import SwiftData

struct NoteBookList: View {
    @Environment(\.modelContext) private var context
    @Query private var noteBooks: [NoteBook]
    
    var body: some View {
        VStack {
            ForEach(noteBooks){ noteBook in
                if noteBooks.isEmpty {
                }else{
                    HStack{
                        Text("\(noteBook.title)")
                        Text("Pages: \(noteBook.page)")
                    }
                    .onTapGesture(count: 2) { _ in
                        delete(noteBook)
                    }
                    .onTapGesture(count: 1) { _ in
                        update(noteBook)
                    }
                }
            }
            
            Button("Add NoteBook") {
                add("TEST")
            }
        }
    }
    private func add(_ title: String) {
        let data = NoteBook(id: UUID(), title: title, page: 100)
        context.insert(data)
    }
    private func delete(_ noteBook: NoteBook) {
        context.delete(noteBook)
    }
    private func update(_ noteBook: NoteBook) {
        noteBook.title = "New NoteBook"
        try? context.save()
    }
    
}


#Preview {
    NoteBookList()
        .modelContainer(for: NoteBook.self)
}
