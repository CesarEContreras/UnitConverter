//
//  ContentView.swift
//  UnitConverter
//
//  Created by Cesar Contreras on 6/10/20.
//  Copyright © 2020 Cesar Contreras. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var inputNumber = ""
    @State private var inputUnit = 0
    @State private var outputUnit = 0
    
    let distanceUnits = ["meters", "kilometers", "feet", "yard", "miles"]
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Input Measure")) {
                    TextField("Measure", text: $inputNumber)
                        .keyboardType(.decimalPad)
                    
                    Picker("Input Unit", selection: $inputUnit) {
                        ForEach(0 ..< distanceUnits.count) {
                            Text("\(self.distanceUnits[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Output  Measure")) {
                    Picker("Output Unit", selection: $outputUnit) {
                        ForEach(0 ..< distanceUnits.count) {
                            Text("\(self.distanceUnits[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
            }
            .navigationBarTitle("Unit Converter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
