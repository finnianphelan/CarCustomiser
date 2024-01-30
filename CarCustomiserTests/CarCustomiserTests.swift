//
//  CarCustomiserTests.swift
//  CarCustomiserTests
//
//  Created by Finnian Phelan on 19/01/2024.
//

import XCTest

final class CarCustomiserTests: XCTestCase {

	func testAllDisplayStatsFunctionsReturnValidData() {
		let car = Car(make: "Mazda", model: "MX-5", topSpeed: 125, acceleration: 7.7, handling: 5)
		
		let carStringStats = car.displayStringStats()
		let carIntStats = car.displayIntStats()
		let carAcceleration = car.displayAcceleration()
		
		XCTAssertEqual(carStringStats["make"], "Mazda")
		XCTAssertEqual(carStringStats["model"], "MX-5")
		XCTAssertEqual(carIntStats["topSpeed"], 125)
		XCTAssertEqual(carAcceleration, 7.7)
		XCTAssertEqual(carIntStats["handling"], 5)
	}

}
