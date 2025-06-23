//
//  TransactionModel.swift
//  ExpenseTracker
//
//  Created by Roxy Pérez  on 17/6/25.
//

import Foundation
import SwiftUIFontIcon

struct Transaction: Identifiable, Decodable, Hashable {
  let id: Int
  let date: String
  let institution: String
  let account: String
  var merchant: String
  let amount: Double
  let type: TransactionType.RawValue
  let categoryId: Int
  let category: String
  let isPending: Bool
  let isTransfer: Bool
  let isExpense: Bool
  let isEdited: Bool

  var icon: FontAwesomeCode {
    if let category = Category.all.first(where: { $0.id == categoryId }) {
      return category.icon
    }
    return .question_circle
  }

  var parsedDate: Date {
    date.dateParsed()
  }

  var signedAmount: Double {
    return type == TransactionType.credit.rawValue ? amount : -amount
  }

  var month: String {
    parsedDate.formatted(.dateTime.year().month(.wide))
  }
}

enum TransactionType: String {
  case credit = "credit"
  case debit = "debit"
}

struct Category {
  let id: Int
  let name: String
  let icon: FontAwesomeCode
  var mainCategoryId: Int?
}

extension Category {
  static let autoAndTransport = Category(
    id: 1,
    name: "Auto y Transporte",
    icon: .car_alt
  )
  static let billsAndUtilities = Category(
    id: 2,
    name: "Facturas y Utilidades",
    icon: .file_invoice
  )
  static let entertainment = Category(
    id: 3,
    name: "Entretenimiento",
    icon: .film
  )
  static let feesAndCharges = Category(
    id: 4,
    name: "Tarifas y Cargos",
    icon: .hand_holding
  )
  static let foodAndDining = Category(
    id: 5,
    name: "Alimentación y Comidas",
    icon: .hamburger
  )
  static let home = Category(id: 6, name: "Casa", icon: .home)
  static let income = Category(id: 7, name: "Ingreso", icon: .euro_sign)
  static let shopping = Category(id: 8, name: "Compras", icon: .shopping_cart)
  static let transfer = Category(
    id: 9,
    name: "Transferencias",
    icon: .exchange_alt
  )

  static let publicTransportation = Category(
    id: 101,
    name: "Transporte Público",
    icon: .bus_alt,
    mainCategoryId: 1
  )
  static let taxi = Category(
    id: 102,
    name: "Taxi",
    icon: .taxi,
    mainCategoryId: 1
  )
  static let mobilePhone = Category(
    id: 201,
    name: "Móvil",
    icon: .mobile_alt,
    mainCategoryId: 2
  )
  static let moviesAndDVDs = Category(
    id: 301,
    name: "Películas y DVDs",
    icon: .film,
    mainCategoryId: 3
  )
  static let bankFee = Category(
    id: 401,
    name: "Comisión Bancaria",
    icon: .hand_holding_usd,
    mainCategoryId: 4
  )
  static let financeCharge = Category(
    id: 402,
    name: "Cargos Financieros",
    icon: .hand_holding_usd,
    mainCategoryId: 4
  )
  static let groceries = Category(
    id: 501,
    name: "Alimentos",
    icon: .shopping_basket,
    mainCategoryId: 5
  )
  static let restaurants = Category(
    id: 502,
    name: "Restaurantes",
    icon: .utensils,
    mainCategoryId: 5
  )
  static let rent = Category(
    id: 601,
    name: "Alquiler",
    icon: .house_user,
    mainCategoryId: 6
  )
  static let homeSupplies = Category(
    id: 602,
    name: "Artículos de Hogar",
    icon: .lightbulb,
    mainCategoryId: 6
  )
  static let paycheque = Category(
    id: 701,
    name: "Cheques",
    icon: .file_invoice_dollar,
    mainCategoryId: 7
  )
  static let software = Category(
    id: 801,
    name: "Software",
    icon: .laptop,
    mainCategoryId: 8
  )
  static let creditCardPayment = Category(
    id: 901,
    name: "Pagos con Tarjeta de Crédito",
    icon: .credit_card,
    mainCategoryId: 9
  )
}

extension Category {
  static let categories: [Category] = [
    .autoAndTransport,
    .publicTransportation,
    .entertainment,
    .feesAndCharges,
    .foodAndDining,
    .home,
    .income,
    .shopping,
    .transfer,
  ]

  static let subCategories: [Category] = [
    .publicTransportation,
    .taxi,
    .mobilePhone,
    .moviesAndDVDs,
    .bankFee,
    .financeCharge,
    .groceries,
    .restaurants,
    .rent,
    .homeSupplies,
    .paycheque,
    .software,
    .creditCardPayment,
  ]

  static let all: [Category] = categories + subCategories
}
