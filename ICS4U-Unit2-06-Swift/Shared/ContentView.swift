//
// ContentView.swift
// ICS4U-Unit2-06-Swift
//
// Created by Marcus A. Mosley on 2021-06-01
// Copyright (C) 2021 Marcus A. Mosley. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var biplane: Airplane = Airplane()
    @State private var boeing: Jet = Jet()
    @State private var text: String = ""
    @State private var tmp = 0

    var body: some View {
        VStack {
            Button("Enter", action: {
                biplane.setSpeed(212)
                text += "\(String(biplane.getSpeed()))"

                boeing.setSpeed(422)
                text += "\n\(String(boeing.getSpeed()))"

                while tmp < 4 {
                  boeing.accelerate()
                  text += "\n\(String(boeing.getSpeed()))"

                  if boeing.getSpeed() > 5000 {
                    biplane.setSpeed(biplane.getSpeed() * 2)
                  } else {
                    boeing.accelerate()
                  }

                  tmp += 1
                }

                text += "\n\(String(biplane.getSpeed()))"
            })
            .padding()
            Text("\(text)")
        }
    }
}

class Airplane {
    private var speed: Int = 0

    // Getters

    func getSpeed() -> Int {
        return self.speed
    }

    // Setters

    func setSpeed(_ speed: Int) {
        self.speed = speed
    }

}

class Jet: Airplane {
    private let MULTIPLIER: Int = 2

    // Setters

    override func setSpeed(_ speed: Int) {
        super.setSpeed(speed * MULTIPLIER)
    }

    // Methods

    func accelerate() {
        super.setSpeed(getSpeed() * 2)
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
