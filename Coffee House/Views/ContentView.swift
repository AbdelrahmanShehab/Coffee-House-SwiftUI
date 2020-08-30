//
//  ContentView.swift
//  Coffee House
//
//  Created by Abdelrahman Shehab on 30/8/2020.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var orderListVM = OrderListViewModel()
    @State private var showModel: Bool = false

    var body: some View {

        NavigationView {

            OrderListView(orders: self.orderListVM.orders)

                .navigationTitle("Coffee Order")
                .navigationBarItems(leading: Button(action: reloadOrder) {
                    Image(systemName: "arrow.clockwise")
                        .foregroundColor(.white)
                }, trailing: Button(action: showAddingCoffeeOrderView) {
                    Image(systemName: "plus")
                        .foregroundColor(.white)
                })

                .sheet(isPresented: self.$showModel, content: {
                    AddingCoffeeOrderView(isPresented: self.$showModel)
                })
        }
    }

    private func showAddingCoffeeOrderView() {
        self.showModel = true
    }

    private func reloadOrder() {
        self.orderListVM.fetchOrders()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
