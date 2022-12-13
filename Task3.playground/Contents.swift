import UIKit

var greeting = "Hello, playground"

// Task 3.2
let myClosure: () -> Void = {
    print("I love Swift")
}

func repeatTask(initialTimes times: Int, task: () -> Void) {
    if times > 0 {
        task()
        repeatTask(initialTimes: times - 1, task: task)
    }
}

repeatTask(initialTimes: 10, task: myClosure)

// Task 3.3
enum Directions {
    case up
    case down
    case left
    case right
}

var location = (0, 0)
let arrayStep: [Directions] = [.up, .up, .left, .down, .left, .down, .down, .right, .right, .down, .right]

func step(
    coordinates: inout (Int, Int),
    stepArray: [Directions]
) {
    func up(coords: inout (Int, Int)) {
        coords = (coords.0, coords.1+1)
    }
    func down(coords: inout (Int, Int)) {
        coords = (coords.0, coords.1-1)
    }
    func left(coords: inout (Int, Int)) {
        coords = (coords.0-1, coords.1)
    }
    func right(coords: inout (Int, Int)) {
        coords = (coords.0+1, coords.1)
    }
    
    for step in arrayStep {
        switch step {
        case .up:
            up(coords: &coordinates)
        case .down:
            down(coords: &coordinates)
        case .left:
            left(coords: &coordinates)
        case .right:
            right(coords: &coordinates)
        }
    }
}

step(coordinates: &location, stepArray: arrayStep)
print(location)

// Task 3.4
class Rectangle {
    let height: Double
    let weight: Double
    
    init(height: Double, weight: Double) {
        self.height = height
        self.weight = weight
    }
    
    func square() {
        let square = height * weight
        print(square)
    }
}

let myRectangle = Rectangle(height: 2.5, weight: 9.3)
myRectangle.square()

extension Rectangle {
    var propertySquare: Double {
        get {
            return height * weight
        }
    }
}

print(myRectangle.propertySquare)
