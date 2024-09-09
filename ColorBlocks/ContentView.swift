//
//  ContentView.swift
//  ColorBlocks
//
//  Created by PM Student on 9/9/24.
//

import SwiftUI

struct ContentView: View {
    
    private var ermWhatApp: [Int] = Array(1...20)
    private let block: [Color] = [.red, .green, .blue, .yellow]
    
    // defines an array with a single adaptive GridItem
    // each item has a minimum width of 170 points
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 170))
    ]
    // flexible column adds space to take up as much space as possible, here there's two
    private let numberColumn = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    // defines an array with two fixed griditems
    private let fixedColumn = [
        GridItem(.fixed(200)),
        GridItem(.fixed(200))
    ]
    
    
    
    
    
    // adaptive layout = adds constraints to its own size with additional constraints of equal width or height, GridItem = arranges child views in rows and columns
    // navigation view = allows you to move from one screen to another, scroll view = allows the user to scroll the items vertically or horizontally
    var body: some View {
        NavigationView {
            ScrollView {
                // lazyVgrid = a container that allows its items to grow vertically
                LazyVGrid(columns: fixedColumn, spacing: 20) {
                    // foreach = a loop used to perform an operation element in an array
                    ForEach(ermWhatApp, id: \.self) { number in
                        ZStack {
                            Rectangle()
                                .frame(width: 170, height: 170)
                                .foregroundColor(block[number%4])
                                .cornerRadius(30)
                            Text("\(number)")
                                .foregroundColor(.white)
                                .font(.system(size: 80, weight: .medium, design: .rounded))
                        }
                    }
                }
            }
            .navigationTitle("Color Blocks")
        }
    }
}
// array = a collection (in swift if you see [] you are probably working with an array)
// : = type of
// i really thought Int was -'s too
#Preview {
    ContentView()
}
