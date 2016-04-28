//: Playground - noun: a place where people can play

//sample playground on protocols

import UIKit

var str = "Hello, playground"

let abc = 12
protocol Flyable {
    var topSpeed:Int { get }
}


protocol Transportable {
    var seatCount:Int{ get }
}


struct Plane : Flyable,Transportable {
    var topSpeed: Int = 360
    var seatCount: Int = 100
}

struct myPlane:Flyable {
    var topSpeed: Int = 1000
}

extension Flyable {
    func isFasterThan(item:Flyable) -> Bool {
        if self.topSpeed > item.topSpeed {
            return true
        } else {
            return false
        }
    }
}

//conditional statement that this method is called if the structure implements this protocol

extension Flyable where Self:Transportable {
    func containsMorePassengers(item:Self) -> Bool {
        if self.seatCount > item.seatCount {
            return true
        } else {
            return false
        }
    }
}


let commercialPlane = Plane()
commercialPlane.seatCount
commercialPlane.topSpeed

let jetPlane = Plane(topSpeed: 500, seatCount: 25)
jetPlane.topSpeed
jetPlane.seatCount


jetPlane.isFasterThan(commercialPlane)
jetPlane.containsMorePassengers(commercialPlane)


//overriding the collection types.
extension CollectionType where Self.Generator.Element:Flyable {
    
    func averageTopSpeed() -> Int {
        var total = 0
        var count = 0
        for  item in self {
            total += item.topSpeed
            count += 1
        }
        return(total/count)
    }
}


let myplanes = [jetPlane,commercialPlane,Plane()]
myplanes.averageTopSpeed()

