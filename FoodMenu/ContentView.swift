//
//  ContentView.swift
//  FoodMenu
//
//  Created by bjorn at work on 2024-09-15.
//

import SwiftUI

struct ContentView: View {
    
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    
    var body: some View {
        VStack {
            NavigationStack {
                List {
                    ForEach(menu) { section in
                        Section(section.name) {
                            ForEach(section.items) { item in
                                NavigationLink(value: item) {
                                    ItemRow(item: item)
                              }
                            }
                        }
                    }

                }
                .navigationTitle("Menu")
                .listStyle(.grouped)
                .navigationDestination(for: MenuItem.self) { item in
                    ItemDetail(item: item)
                }
            }

        }
        .padding()
    }
}

#Preview {
    ContentView()
}
