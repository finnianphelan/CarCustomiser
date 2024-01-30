//
//  ContentView.swift
//  CarCustomiser
//
//  Created by Finnian Phelan on 19/01/2024.
//

import SwiftUI

struct ContentView: View {
	
	@State var carsIndex = 0
	@State var remainingFunds = 1000
	
	@State var cars = [
		Car(make: "Mazda", model: "MX-5", topSpeed: 125, acceleration: 7.7, handling: 5),
		Car(make: "Audi", model: "MX-5", topSpeed: 125, acceleration: 7.7, handling: 5),
		Car(make: "BMW", model: "MX-5", topSpeed: 125, acceleration: 7.7, handling: 5),
		Car(make: "Mercedes", model: "MX-5", topSpeed: 125, acceleration: 7.7, handling: 5),
		Car(make: "Toyota", model: "MX-5", topSpeed: 125, acceleration: 7.7, handling: 5)
	]
	
	@State var exhaustPackage = false
	@State var tiresPackage = false
	@State var driveTrainPackage = false
	@State var ecuFuelPackage = false

    var body: some View {
		
		let exhaustPackageBinding = Binding<Bool> (
			get: {self.exhaustPackage},
			set: { newValue in
				self.exhaustPackage = newValue
				if newValue == true {
					cars[carsIndex].acceleration -= 1
					remainingFunds -= 500
				} else {
					cars[carsIndex].acceleration += 1
					remainingFunds += 500
				}
			}
		)
		
		let tiresPackageBinding = Binding<Bool> (
			get: {self.tiresPackage},
			set: { newValue in
				self.tiresPackage = newValue
				if newValue == true {
					cars[carsIndex].handling += 2
					remainingFunds -= 500
				} else {
					cars[carsIndex].handling -= 2
					remainingFunds += 500
				}
			}
		)
		
		let driveTrainPackageBinding = Binding<Bool> (
			get: {self.driveTrainPackage},
			set: { newValue in
				self.driveTrainPackage = newValue
				if newValue == true {
					cars[carsIndex].topSpeed += 5
					remainingFunds -= 500
				} else {
					cars[carsIndex].topSpeed -= 5
					remainingFunds += 500
				}
			}
		)
		
		let ecuFuelPackageBinding = Binding<Bool> (
			get: {self.ecuFuelPackage},
			set: { newValue in
				self.ecuFuelPackage = newValue
				if newValue == true {
					cars[carsIndex].topSpeed += 3
					cars[carsIndex].acceleration -= 1.5
					remainingFunds -= 1000
				} else {
					cars[carsIndex].topSpeed -= 3
					cars[carsIndex].acceleration += 1.5
					remainingFunds += 1000
				}
			}
		)
		
		Form {
			VStack(alignment: .leading, spacing: 20) {
				Text(cars[carsIndex].displayStats())
				Button(action: {
					if carsIndex != cars.count-1 {
						carsIndex += 1
					} else {
						carsIndex = 0
					}
					
					resetDisplay()
				}, label: {Text("Next Car")})
			}
			
			Section {
				Toggle("Exhaust Package (Cost: 500)", isOn: exhaustPackageBinding)
				Toggle("Tires Package (Cost: 500)", isOn: tiresPackageBinding)
				Toggle("Drivetrain Package (Cost: 500)", isOn: driveTrainPackageBinding)
				Toggle("ECU & Fuel Package (Cost: 1000)", isOn: ecuFuelPackageBinding)
			}
			
			Text("Remaining Funds: \(remainingFunds)")
				.foregroundColor(.red)
		}
    }
	
	func resetDisplay() {
		remainingFunds = 1000
		exhaustPackage = false
		tiresPackage = false
		driveTrainPackage = false
		ecuFuelPackage = false
		
		cars = [
			Car(make: "Mazda", model: "MX-5", topSpeed: 125, acceleration: 7.7, handling: 5),
			Car(make: "Audi", model: "MX-5", topSpeed: 125, acceleration: 7.7, handling: 5),
			Car(make: "BMW", model: "MX-5", topSpeed: 125, acceleration: 7.7, handling: 5),
			Car(make: "Mercedes", model: "MX-5", topSpeed: 125, acceleration: 7.7, handling: 5),
			Car(make: "Toyota", model: "MX-5", topSpeed: 125, acceleration: 7.7, handling: 5)
		]
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
