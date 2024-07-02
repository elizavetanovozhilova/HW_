protocol Power {
    var power: Int { get }
    var brand: String { get }
}

// протоколы, это хорошо, но проперти brand уже есть в классе Car, так что это излишне


class Car {
    var brand: String
    var model: String
    var color: String

    init(brand: String, model: String, color: String) {
        self.brand = brand
        self.model = model
        self.color = color
    }

    func info() {
        print("The brand of the car: \(self.brand)\nThe model of the car: \(self.model)\nThe color of the car: \(self.color)")
    }
}

class Renault: Car, Power {
    var numOfDoors: Int
    var power: Int

    init(numOfDoors: Int, power: Int, brand: String, model: String, color: String) {
        self.numOfDoors = numOfDoors
        self.power = power
        super.init(brand: brand, model: model, color: color)
    }

    override func info() {
        super.info()
        print("Renault has \(self.numOfDoors) doors and the car's power is \(self.power) horsepower")
    }
}

class Mercedes: Car, Power {
    var numOfDoors: Int
    var power: Int

    init(numOfDoors: Int, power: Int, brand: String, model: String, color: String) {
        self.numOfDoors = numOfDoors
        self.power = power
        super.init(brand: brand, model: model, color: color)
    }

    override func info() {
        super.info()
        print("Mercedes has \(self.numOfDoors) doors and the car's power is \(self.power) horsepower")
    }
}

class Ferrari: Car, Power {
    var numOfDoors: Int
    var power: Int

    init(numOfDoors: Int, power: Int, brand: String, model: String, color: String) {
        self.numOfDoors = numOfDoors
        self.power = power
        super.init(brand: brand, model: model, color: color)
    }

    override func info() {
        super.info()
        print("Ferrari has \(self.numOfDoors) doors and the car's power is \(self.power) horsepower")
    }
}

class Chrysler: Car, Power {
    var numOfDoors: Int
    var power: Int

    init(numOfDoors: Int, power: Int, brand: String, model: String, color: String) {
        self.numOfDoors = numOfDoors
        self.power = power
        super.init(brand: brand, model: model, color: color)
    }

    override func info() {
        super.info()
        print("Chrysler has \(self.numOfDoors) doors and the car's power is \(self.power) horsepower")
    }
}

/*
 Все машины имеют одинаковые поля, это нарушает правило дублирования кода, можно было бы тут также создать отдельный класс, типа CarDop, который бы наследовался от Car, а все марки уже наследовать от CarDop и был бы у тебя там 1 метод init, который бы вызывал super.init
 */

func createCar() -> [Car & Power] {
    let cars: [Car & Power] = [
        Renault(numOfDoors: 5, power: 97, brand: "Renault", model: "Logan", color: "white"),
        Mercedes(numOfDoors: 3, power: 223, brand: "Mercedes", model: "cls 200", color: "dark green"),
        Ferrari(numOfDoors: 3, power: 310, brand: "Ferrari", model: "488 pista spider", color: "red"),
        Chrysler(numOfDoors: 5, power: 178, brand: "Chrysler", model: "town country", color: "blue")
    ]
    return cars
}

/*
  Есть ощущение, что в задании просили написать метод, который бы по введённым параметрам от пользователя/от тебя создавал бы машины.
  То есть не нужно было создавать массив машин, в этом случае ты можешь воспользоваться методом единожды, если ты захочешь добавить ещё автомобили, то тебе прийдётся менять сам метод, это не эффективно
  Тут самым лучшим вариантом было бы создать структуру, в ней был бы массив машин и метод мутационный, который бы добавлял по параметрам новую машину
 */

func race(firstCar: Power, secondCar: Power) -> Power {
    if firstCar.power > secondCar.power {
        return firstCar
    } else {
        return secondCar
    }
}

var cars = createCar()

func bigRace(cars: [Car & Power]) {
    var remainingCars = cars
    var round = 1
    while remainingCars.count > 1 {
        print("\nRound \(round):")
        var nextRoundCars: [Car & Power] = []
            
        for i in stride(from: 0, to: remainingCars.count, by: 2) {
            let firstCar = remainingCars[i]
            let secondCar = remainingCars[i + 1]
                
            let winner = race(firstCar: firstCar as Power, secondCar: secondCar as Power)
            nextRoundCars.append(winner as! Car&Power)
                
            print("Race between \(firstCar.brand) and \(secondCar.brand): Winner is \(winner.brand)")
        }
            
        remainingCars = nextRoundCars
        round += 1
    }
        
    if let finalWinner = remainingCars.first {
        print("\nOverall Winner: \(finalWinner.brand)")
        }
}

bigRace(cars: cars)

// последние методы мне нравятся, молодец!)


//let car = Car(brand: "BMW", model: "I8", color: "pink")
//let renault = Renault(numOfDoors: 5, power: 200, brand: "Renault", model: "Logan" , color: "white")
//renault.info()

//let re = Renault(numOfDoors: 5, power: 97, brand: "Renault", model: "Logan", color: "white")
//let me = Mercedes(numOfDoors: 3, power: 223, brand: "Mercedes", model: "cls 200", color: "dark green")
//print(race(firstCar: re, secondCar: me))
