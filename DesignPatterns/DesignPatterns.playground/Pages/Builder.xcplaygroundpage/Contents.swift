protocol Builder {
    func produceCoffee()
    func produceDoubleCoffee()
    func produceMilk()
    func produceCream()
    func produceSugar()
    func produceCinnamon()
    func produceSyrup()
}

class ConcreteBuilder: Builder {
    private var product = Product()
    
    func reset() {
        product = Product()
    }
    
    func produceCoffee() {
        product.add(component: "Coffee")
    }
    
    func produceDoubleCoffee() {
        product.add(component: "Double Coffee")
    }
    
    func produceMilk() {
        product.add(component: "Milk")
    }
    
    func produceCream() {
        product.add(component: "Cream")
    }
    
    func produceSugar() {
        product.add(component: "Sugar")
    }
    
    func produceCinnamon() {
        product.add(component: "Cinnamon")
    }
    
    func produceSyrup() {
        product.add(component: "Syrup")
    }
    
    func retrieveProduct() -> Product {
        let result = self.product
        reset()
        return result
    }
}

class Director {
    private var builder: Builder?
    
    func update(builder: Builder) {
        self.builder = builder
    }
    
    func buildMinimalProduct() {
        builder?.produceCoffee()
    }
    
    func buildProductWithFeatures() {
        builder?.produceCoffee()
        builder?.produceMilk()
        builder?.produceCinnamon()
    }
}

class Product {
    private var components = [String]()
    
    func add(component: String) {
        self.components.append(component)
    }
    
    func componentsOfCoffee() -> String {
        return "Components of coffee: " + components.joined(separator: " + ") + "\n"
    }
}

class Client {
    static func testBuilder(director: Director) {
        let builder = ConcreteBuilder()
        director.update(builder: builder)
        
        print("Standard basic product:")
        director.buildMinimalProduct()
        print(builder.retrieveProduct().componentsOfCoffee())
        
        print("Standard product with features:")
        director.buildProductWithFeatures()
        print(builder.retrieveProduct().componentsOfCoffee())
        
        print("Custom product:")
        builder.produceDoubleCoffee()
        builder.produceSugar()
        print(builder.retrieveProduct().componentsOfCoffee())
    }
}

let director = Director()
Client.testBuilder(director: director)
