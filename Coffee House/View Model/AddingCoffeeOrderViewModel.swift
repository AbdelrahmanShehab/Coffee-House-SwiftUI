//
//  AddingCoffeeOrderViewModel.swift
//  Coffee House
//
//  Created by Abdelrahman Shehab on 29/8/2020.
//

import Foundation

class AddingCoffeeOrderViewModel: ObservableObject {

    var name: String = ""
    @Published var coffeeName: String = ""
    @Published var size: String = "Medium"
    var total: Double {
        return calculateTotalPrice()
    }

    var coffeeList: [CoffeeViewModel] {
        return Coffee.all().map(CoffeeViewModel.init)
    }
    
    var orderService: OrderService

    init() {
        self.orderService = OrderService()
    }

    func placeOrder() {

        let order = Order(name: self.name, coffeeName: self.coffeeName, total: self.total, size: self.size)
        orderService.createCoffeeOrder(order: order) { _ in

        }
    }

    private func sizePrice() -> Double {

        let priceForSizes = ["Small": 1.0, "Medium": 1.5, "Large": 1.75]
        return priceForSizes[self.size]!
    }

    private func calculateTotalPrice() -> Double {

        let coffeeVM = self.coffeeList.first {$0.name == coffeeName}

        if let coffeeVM = coffeeVM {
            return coffeeVM.price * sizePrice()
        } else {
            return 0.0
        }
    }
}
