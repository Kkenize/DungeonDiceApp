//
//  ContentView.swift
//  DungeonDiceApp
//
//  Created by Zhejun Zhang on 2/17/25.
//

import SwiftUI

struct ContentView: View {
    enum Dice: Int, CaseIterable, Identifiable {
        
        case four = 4
        case six = 6
        case eight = 8
        case ten = 10
        case twelve = 12
        case twenty = 20
        case hundred = 100
        
        var id: Int {
            rawValue
        }
        
        var description: String {
            "\(rawValue)-sided"
        }
        
        func roll() -> Int {
            return Int.random(in: 1...self.rawValue)
        }
    }
    
    @State private var message = ""
    @State private var animationTrigger = false
    @State private var isDoneAnimating = true
    
    var body: some View {
        VStack {
            Text("Dungeon Dice")
                .font(.largeTitle)
                .fontWeight(.black)
                .foregroundColor(.red)
            
            Spacer()
            
            Text(message)
                .font(.largeTitle)
                .fontWeight(.medium)
                .frame(height: 150)
//                .scaleEffect(isDoneAnimating ? 1.0 : 0.6)
//                .opacity(isDoneAnimating ? 1.0 : 0.2)
                .rotation3DEffect(isDoneAnimating ? .degrees(360): .degrees(0), axis: (x: 1.0, y: 0.0, z: 0.0))
                .minimumScaleFactor(0.5)
                .multilineTextAlignment(.center)
//                .animation(.default, value: animationTrigger)
//                .onChange(of: animationTrigger) {
//                    isDoneAnimating = false
//                    withAnimation(.spring(response: 0.3, dampingFraction: 0.4)){
//                        isDoneAnimating = true
//                    }
//                }
                .onChange(of: animationTrigger) {
                    isDoneAnimating = false
                    withAnimation(.interpolatingSpring(duration: 0.6, bounce: 0.4)){
                        isDoneAnimating = true
                    }
                }
            
            Spacer()
            
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 102))]) {
                Group {
                    ForEach(Dice.allCases) { dice in
                        Button(dice.description) {
                            message = "You rolled a \(dice.roll()) on a \(dice.rawValue)-sided dice"
                            animationTrigger.toggle()
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.red)
                    }
                }
                
            }
            
            //            Group {
            //                HStack {
            //                    Button("\(Dice.four.rawValue)-sided") {
            //                        message = "You rolled a \(Dice.four.roll()) on a \(Dice.four.rawValue)-sided dice"
            //                    }
            //
            //                    Spacer()
            //
            //                    Button("\(Dice.six.rawValue)-sided") {
            //                        message = "You rolled a \(Dice.six.roll()) on a \(Dice.six.rawValue)-sided dice"
            //                    }
            //
            //                    Spacer()
            //
            //                    Button("\(Dice.eight.rawValue)-sided") {
            //                        message = "You rolled a \(Dice.eight.roll()) on a \(Dice.eight.rawValue)-sided dice"
            //                    }
            //                }
            //                .buttonStyle(.borderedProminent)
            //                .tint(.red)
            //                HStack {
            //                    Button("\(Dice.ten.rawValue)-sided") {
            //                        message = "You rolled a \(Dice.ten.roll()) on a \(Dice.ten.rawValue)-sided dice"
            //                    }
            //
            //                    Spacer()
            //
            //                    Button("\(Dice.twelve.rawValue)-sided") {
            //                        message = "You rolled a \(Dice.twelve.roll()) on a \(Dice.twelve.rawValue)-sided dice"
            //                    }
            //
            //                    Spacer()
            //
            //                    Button("\(Dice.twenty.rawValue)-sided") {
            //                        message = "You rolled a \(Dice.twenty.roll()) on a \(Dice.twenty.rawValue)-sided dice"
            //                    }
            //                }
            //                .buttonStyle(.borderedProminent)
            //                .tint(.red)
            //                Button("\(Dice.hundred.rawValue)-sided") {
            //                    message = "You rolled a \(Dice.eight.roll()) on a \(Dice.hundred.rawValue)-sided dice"
            //                }
            //                .buttonStyle(.borderedProminent)
            //                .tint(.red)
            //            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

