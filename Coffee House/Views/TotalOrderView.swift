//
//  OrderTotalView.swift
//  Coffee House
//
//  Created by Abdelrahman Shehab on 30/8/2020.
//

import SwiftUI

struct TotalOrderView: View {
    let total: Double

    var body: some View {

        HStack(alignment: .center) {
            Spacer()
            Text(String(format: "$%0.2f", self.total))
                .font(.title)
                .foregroundColor(.green)
            Spacer()
        }.padding(10)
    }
}

struct OrderTotalView_Previews: PreviewProvider {
    static var previews: some View {
        TotalOrderView(total: 45.55)
    }
}
