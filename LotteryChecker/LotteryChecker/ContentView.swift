//
//  ContentView.swift
//  LotteryChecker
//
//  Created by 홍재민 on 7/2/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var winningLotteryNumbers: [Int] = []
    @State var randomLotteryNumbersArr: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: 15), count: 15)
    @State var bonus: Int = 0
    
    var body: some View {
        VStack(spacing: 20) {
            Text("로또 시뮬레이터")
                .font(.largeTitle)
                .bold()
            
            Button("번호 생성") {
                initLottery()
            }
            .padding(15)
            .font(.largeTitle)
            .foregroundStyle(.white)
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            
            Text("당첨 번호\n\(winningLotteryNumbers.map {String($0)}.joined(separator: " , "))")
                .font(.title)
                .bold()
                .multilineTextAlignment(.center)
            
            Text("보너스 번호\n\(bonus)")
                .font(.title)
                .bold()
                .multilineTextAlignment(.center)
        }
        .onAppear(perform: {
            initLottery()
        })
        
        List {
            ForEach(randomLotteryNumbersArr.indices, id: \.self) { index in
                let numbers: [Int] = randomLotteryNumbersArr[index]
                let result: Int = getRank(numbers: numbers)
                let rank: String = if result == -1 {
                    "꽝"
                } else {
                    "\(result)"
                }

                Text("\(index + 1)번 로또: \(numbers.map{String($0)}.joined(separator: " , "))\n등수: \(rank)")
            }
            .font(.title)
            .bold()
            .frame(width: 250, height: 45)
            .minimumScaleFactor(0.05)
            .listRowBackground(Color(uiColor: .systemGray4))
        }
        .scrollContentBackground(.hidden)
    }
    
    func initLottery() {
        winningLotteryNumbers = getRandomNumbersNotDuplicate(count: 6)
        bonus = Int.random(in: 1 ..< 46)
        
        while winningLotteryNumbers.contains(bonus) {
            bonus = Int.random(in: 1 ..< 46)
        }
        
        for i in 0 ..< 15 {
            randomLotteryNumbersArr[i] = getRandomNumbersNotDuplicate(count: 6)
        }
    }
    
    func getRandomNumbersNotDuplicate(count: Int) -> [Int] {
        var numbers: Set<Int> = Set<Int>()
        
        while numbers.count < 6 {
            numbers.insert(Int.random(in: 1 ..< 46))
        }
        
        return numbers.sorted()
    }
    
    func getRank(numbers: [Int]) -> Int {
        
        var rank: Int = 0
        var count: Int = 0
        var differentNum: Int = 0
       
        for number in numbers {
            if winningLotteryNumbers.contains(number) {
                count += 1
            } else {
                differentNum = number
            }
        }
        
        rank = getComputedRankResultFromCount(count: count, differentNum: differentNum)
        
        return rank
    }
    
    func getComputedRankResultFromCount(count: Int, differentNum: Int) -> Int {
        
        var rank: Int = 0
        
        switch count {
        case 6:
            rank = 1
        case 5:
            if differentNum == bonus {
                rank = 2
            } else {
                rank = 3
            }
        case 4:
            rank = 4
        case 3:
            rank = 5
        default:
            rank = -1
        }
        
        return rank
    }
}

#Preview {
    ContentView()
}
