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
    @State private var isAddNoteBookPresented: Bool = false
    
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
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Add NoteBook"){
                    isAddNoteBookPresented = true
                }
            }
        }
        .sheet(isPresented: $isAddNoteBookPresented) {
            NavigationStack{
                AddNoteBook()
            }
        }
    }
    private func add(_ title: String) {
        let data = NoteBook(id: UUID(), title: title, page: 100)
        context.insert(data)
        do {
            try context.save()
        }catch{
            print(error.localizedDescription)
        }
    }
    private func delete(_ noteBook: NoteBook) {
        context.delete(noteBook)
    }
    private func update(_ noteBook: NoteBook) {
        noteBook.title = "New NoteBook"
        do {
            try context.save()
        }catch{
            print(error.localizedDescription)
        }
    }
    
}


#Preview {
    NoteBookList()
        .modelContainer(for: NoteBook.self)
}


struct AddNoteBook: View {
    @Environment(\.dismiss) private var dismiss
        @Environment(\.modelContext) private var context
    
    @State private var title: String = ""
    @State private var page: Int = 10
    var body: some View {
        Form{
            TextField("Title", text: $title)
            TextField("Year", value: $page, format: .number)
        }
        .navigationTitle("Add Movie")
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Close") {
                    dismiss()
                }
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button("Save") {
                                        
                    let noteBook = NoteBook(id: UUID(), title: title, page: page)
                    context.insert(noteBook)
                    
                    do {
                        try context.save()
                    } catch {
                        print(error.localizedDescription)
                    }
                    
                    dismiss()
                }
            }
        }
    }
}
