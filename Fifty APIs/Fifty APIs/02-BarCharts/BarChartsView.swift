//
//  BarChartsView.swift
//  Fifty APIs
//
//  Created by Dielson Sales de Carvalho on 03/10/25.
//

import Charts
import SwiftUI

struct SalesData: Identifiable {
    let id = UUID()
    let month: String
    let sales: Int
}

struct BarChartsView: View {
    private let salesData = [
        SalesData(month: "Jan", sales: 340),
        SalesData(month: "Feb", sales: 184),
        SalesData(month: "Mar", sales: 289)
    ]
    var body: some View {
        Chart {
            ForEach(salesData) { saleData in
                BarMark(
                    x: .value("Month", saleData.month),
                    y: .value("Sales", saleData.sales)
                )
            }
        }
        .frame(height: 300)
        .padding()
        .navigationTitle("Bar Charts")
    }
}

#Preview {
    BarChartsView()
}
