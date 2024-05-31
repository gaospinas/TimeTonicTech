//  LandingView.swift
//  TimetonicBooks
//
//  Created by Gustavo Ospina on 29/05/24.
//

import SwiftUI

struct LandingView: View {
    @StateObject var vm = LandingViewModel()

    var body: some View {
        NavigationView {
            List(vm.bookList) { book in
                VStack {
                    if let imageURL = book.coverImageURL, let url = URL(string: imageURL) {
                        AsyncImage(url: url) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .cornerRadius(5)
                        } placeholder: {
                            ProgressView()
                                .frame(width: 50, height: 50)
                        }
                    } else {
                        Image(systemName: "book")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                            .cornerRadius(5)
                    }

                    VStack(alignment: .leading, spacing: 5) {
                        Text(book.description ?? "No Description")
                            .font(.headline)
                            .foregroundColor(.primary)

                        Text("Members: \(book.nbMembers ?? 0)")
                            .frame(maxWidth: .infinity)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .padding(.top, 10)
                    }
                   
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
                .listRowSeparator(.hidden)
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Books")
            .onAppear {
                Task {
                    await vm.fetchBookList()
                }
            }
            .background(Color.gray.opacity(0.1))
        }
    }
}

#Preview {
    LandingView()
}
