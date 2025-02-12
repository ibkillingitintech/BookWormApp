//
//  AddBookView.swift
//  Project11-Bookworm-SwiftData
//

//

import SwiftUI

struct AddBookView: View {
    @Environment(\.modelContext) var modelContext
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = "Fantasy"
    @State private var review = ""
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Name of book", text: $title)
                    TextField("Author's name", text: $author)

                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }

                Section("Write a review") {
                    TextEditor(text: $review)
                    RatingView(rating: $rating)
                }

                Section {
                    Button("Save") {
                        guard !title.trimmingCharacters(in: .whitespaces).isEmpty,
                                  !author.trimmingCharacters(in: .whitespaces).isEmpty,
                                  !genre.trimmingCharacters(in: .whitespaces).isEmpty else {
                                return // Maybe show an alert here instead
                            }
                        
                        let newBook = Book(title: title, author: author, genre: genre, review: review, rating: rating, date: Date.now)

                        modelContext.insert(newBook)
                        dismiss()
                    }
                }
            }
            .navigationTitle("Add Book")
        }
    }
}

#Preview {
    AddBookView()
}
