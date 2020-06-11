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
    
    var outputNumber: Double {
        let value = Double(inputNumber) ?? 0
        let fromUnit = distanceUnits[inputUnit]
        let toUnit = distanceUnits[outputUnit]
        
        var outputValue: Double = 0
        var valueInMeter: Measurement<UnitLength>
        
        
        switch fromUnit {
        case "kilometers":
            let distanceKm = Measurement(value: value, unit: UnitLength.kilometers)
            valueInMeter = distanceKm.converted(to: UnitLength.meters)
        case "feet":
            let distanceFt = Measurement(value: value, unit: UnitLength.feet)
            valueInMeter = distanceFt.converted(to: UnitLength.meters)
        case "yard":
            let distanceYard = Measurement(value: value, unit: UnitLength.yards)
            valueInMeter = distanceYard.converted(to: UnitLength.meters)
        case "miles":
            let distanceMiles = Measurement(value: value, unit: UnitLength.miles)
            valueInMeter = distanceMiles.converted(to: UnitLength.meters)
        default:
            valueInMeter = Measurement(value: value, unit: UnitLength.meters)
        }
        
        switch toUnit {
        case "meters":
            outputValue = valueInMeter.value
        case "kilometers":
            outputValue = valueInMeter.converted(to: UnitLength.kilometers).value
        case "feet":
            outputValue = valueInMeter.converted(to: UnitLength.feet).value
        case "yard":
            outputValue = valueInMeter.converted(to: UnitLength.yards).value
        case "miles":
            outputValue = valueInMeter.converted(to: UnitLength.miles).value
        default:
            outputValue = 0
        }
        
        return outputValue
    }
    
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
                
                Section(header: Text("Output  Unit")) {
                    Picker("Output Unit", selection: $outputUnit) {
                        ForEach(0 ..< distanceUnits.count) {
                            Text("\(self.distanceUnits[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Output Measure")) {
                    Text("\(outputNumber, specifier: "%.4f")")
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
