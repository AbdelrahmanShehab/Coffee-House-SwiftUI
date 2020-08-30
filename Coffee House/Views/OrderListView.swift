//
//  OrderListView.swift
//  Coffee House
//
//  Created by Abdelrahman Shehab on 29/8/2020.
//

import SwiftUI

struct OrderListView: View {

    let orders: [OrderViewModel]

    init(orders: [OrderViewModel]) {
        self.orders = orders
    }

    var body: some View {

        List {

            ForEach(self.orders, id: \.id) { order in
                HStack {

                    Image(order.coffeeName)
                        .resizable()
                        .frame(width: 100, height: 100)
                        .cornerRadius(12)
                        .shadow(radius: 10)

                    VStack(alignment: .leading) {

                        Text(order.name)
                            .font(.title)
                            .foregroundColor(.blue)
                            .bold()
                            .padding([.leading, .bottom], 10)

                        HStack {
                            Text(order.coffeeName)
                                .foregroundColor(.white)
                                .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                                .background(Color.green)
                                .cornerRadius(7)
                                .shadow(radius: 8)

                            Spacer()

                            Text(order.size)
                                .foregroundColor(.white)
                                .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                                .background(Color.pink)
                                .cornerRadius(7)
                                .shadow(radius: 8)
                        }
                    }

                }
            }
        }
    }
}

struct OrderListView_Previews: PreviewProvider {
    static var previews: some View {
        OrderListView(orders: [OrderViewModel(order: Order(name: "Abdelrahman Shehab", coffeeName: "Regular", total: 11.35, size: "Large"))])
    }
}
