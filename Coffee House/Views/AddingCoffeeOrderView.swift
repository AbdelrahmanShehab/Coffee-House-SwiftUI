//
//  AddingCoffeeOrderView.swift
//  Coffee House
//
//  Created by Abdelrahman Shehab on 30/8/2020.
//

import SwiftUI

struct AddingCoffeeOrderView: View {
    @Binding var isPresented: Bool
    @ObservedObject var addingCoffeOrderVM = AddingCoffeeOrderViewModel()

    var body: some View {
        NavigationView {

            Form {
                Section(header: Text("Information").font(.body)) {
                    TextField(("Enter Name"), text: self.$addingCoffeOrderVM.name)
                }

                Section(header: Text("Select Coffee").font(.body)) {

                    ForEach(addingCoffeOrderVM.coffeeList, id: \.name) { coffee in

                        CoffeeCellView(coffee: coffee, selection: self.$addingCoffeOrderVM.coffeeName)
                    }
                }

                Section(header: Text("SELECT COFFEE SIZE"), footer: OrderTotalView(total: self.addingCoffeOrderVM.total)) {

                    Picker("", selection: self.$addingCoffeOrderVM.size) {
                        Text("Small").tag("Small")
                        Text("Medium").tag("Medium")
                        Text("Large").tag("Large")
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }

                HStack {
                    Button("Place Order") {
                        self.addingCoffeOrderVM.placeOrder()
                        self.isPresented = false
                    }
                }.padding(EdgeInsets(top: 12, leading: 100, bottom: 015, trailing: 120))
                .foregroundColor(Color.white)
                .background(Color(red: 0.00, green: 0.45, blue: 1.00))
                .cornerRadius(10)
                .shadow(radius: 10)


            }
            .navigationTitle("Add Order")
        }
    }
}

struct AddingCoffeeOrderView_Previews: PreviewProvider {
    static var previews: some View {
        AddingCoffeeOrderView(isPresented: .constant(false))
    }
}

struct CoffeeCellView: View {
    let coffee: CoffeeViewModel
    @Binding var selection: String

    var body: some View {

        HStack {
            Image(coffee.imageURL)
                .resizable()
                .frame(width: 80, height: 80)
                .cornerRadius(16)
                .shadow(radius: 10)

            Text(coffee.name)
                .font(.title2)
                .padding([.leading], 10)

            Spacer()

            Image(systemName: self.selection == self.coffee.name ? "checkmark" : "")
                .padding()
        }.onTapGesture {
            selection = coffee.name
        }
    }
}
