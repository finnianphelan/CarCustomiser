//
//  Car.swift
//  CarCustomiser
//
//  Created by Finnian Phelan on 19/01/2024.
//

import Foundation

struct Car {
	let make: String
	let model: String
	var topSpeed: Int
	var acceleration: Double
	var handling: Int
	
	func displayStats() -> String {
		return """
Make: \(make)
Model: \(model)
Top Speed: \(topSpeed)mph
Acceleration (0-60 in): \(acceleration)s
Handling: \(handling)
"""
	}
	
	func displayStringStats() -> [String:String] {
		return ["make": make, "model": model]
	}
	
	func displayIntStats() -> [String:Int] {
		return ["topSpeed": topSpeed, "handling": handling]
	}
	
	func displayAcceleration() -> Double {
		return acceleration
	}
}
