//
//  ContentView.swift
//  DisplayMaxAndMin_SwiftUI
//
//  Created by 홍재민 on 6/26/24.
//

import SwiftUI

struct ContentView: View {
    @State var maxDisplayText: String = "Max: 00000"
    @State var minDisplayText: String = "Min: 00000"
    
    var body: some View {
        VStack {
            Button("Int") {
                UpdateInfoTexts(max: Int.max, min: Int.min)
            }
            .foregroundStyle(.white)
            .padding(5)
            .background(.mint)
            
            Button("UInt") {
                UpdateInfoTexts(max: UInt32.max, min: UInt32.min)
            }
            .foregroundStyle(.white)
            .padding(5)
            .background(.mint)
            
            Button("Int8") {
                UpdateInfoTexts(max: Int8.max, min: Int8.min)
            }
            .foregroundStyle(.white)
            .padding(5)
            .background(.mint)
            
            Button("Int16") {
                UpdateInfoTexts(max: Int16.max, min: Int16.min)
            }
            .foregroundStyle(.white)
            .padding(5)
            .background(.mint)
            
            Button("Float") {
                UpdateInfoTexts(max: Float.greatestFiniteMagnitude, min: Float.leastNormalMagnitude)
            }
            .foregroundStyle(.white)
            .padding(5)
            .background(.mint)
            
            Button("Double") {
                UpdateInfoTexts(max: Double.greatestFiniteMagnitude, min: Double.leastNormalMagnitude)
            }
            .foregroundStyle(.white)
            .padding(5)
            .background(.mint)
            
            Text(maxDisplayText)
            Text(minDisplayText)
        }
        .padding()
        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
    }
    
    func UpdateInfoTexts<T>(max: T, min: T) {
        maxDisplayText = "Max: \(max)"
        minDisplayText = "Min: \(min)"
    }
}

#Preview {
    ContentView()
}
