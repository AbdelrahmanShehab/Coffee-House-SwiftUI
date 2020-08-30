//
//  CoffeeViewModel.swift
//  Coffee House
//
//  Created by Abdelrahman Shehab on 29/8/2020.
//

import Foundation

struct CoffeeListViewModel {

    var coffeeList: [CoffeeViewModel] = [CoffeeViewModel]()
}

struct CoffeeViewModel {

    var coffee: Coffee

    init(coffee: Coffee) {
        self.coffee = coffee
    }

    var name: String {
        return self.coffee.name
    }

    var imageURL: String {
        return self.coffee.imageURL
    }

    var price: Double {
        return self.coffee.price
    }
}
