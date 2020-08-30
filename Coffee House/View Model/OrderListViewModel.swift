//
//  OrderListViewModel.swift
//  Coffee House
//
//  Created by Abdelrahman Shehab on 29/8/2020.
//

import Foundation

class OrderListViewModel: ObservableObject{

    @Published var orders = [OrderViewModel]()

    init() {
        
        fetchOrders()
    }

    func fetchOrders() {

        OrderService().getOrders { (orders) in
            if let orders = orders {
                self.orders = orders.map(OrderViewModel.init)
            }
        }
    }

}

class OrderViewModel {

    let id = UUID()
    var order: Order

    init(order: Order) {
        self.order = order
    }

    var name: String {
        return self.order.name
    }

    var coffeeName: String {
        return self.order.coffeeName
    }

    var size: String {
        return self.order.size
    }

    var total: Double {
        return self.order.total
    }

}
