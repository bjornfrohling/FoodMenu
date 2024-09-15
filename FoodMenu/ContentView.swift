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
                                Text(item.name)
                            }
                        }
                    }

                }
                .navigationTitle("Menu")
                .listStyle(.grouped)
            }

        }
        .padding()
    }
}

#Preview {
    ContentView()
}
