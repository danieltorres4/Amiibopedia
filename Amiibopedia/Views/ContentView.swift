//
//  ContentView.swift
//  Amiibopedia
//
//  Created by Iván Sánchez Torres on 08/03/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: ViewModel = ViewModel()
    @State var amiiboToSearch: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Button("Reset") {
                    Task {
                        await viewModel.getAllAmiibos()
                    }
                }
                .padding()
                .buttonStyle(.bordered)
                
                Form {
                    ForEach(viewModel.amiibos, id: \.tail) { amiibo in
                        HStack {
                            AsyncImage(url: URL(string: amiibo.image)!) { image in
                                image
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                    .scaledToFit()
                            } placeholder: {
                                ProgressView()
                            }
                            NavigationLink("\(amiibo.name)", destination: AmiiboDetailView(singleAmiibo: amiibo))
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle("Amiibopedia")
        }
        .onAppear {
            Task {
                await viewModel.getAllAmiibos()
            }
        }
        .searchable(text: $amiiboToSearch, prompt: Text("Search an Amiibo"))
        .textInputAutocapitalization(.never)
        .autocorrectionDisabled()
        .onSubmit(of: .search) {
            print("Amiibo to search: \(amiiboToSearch)")
            
            Task {
                await viewModel.getAmiibo(character: amiiboToSearch)
                print("Amiibo to search: \(amiiboToSearch)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
