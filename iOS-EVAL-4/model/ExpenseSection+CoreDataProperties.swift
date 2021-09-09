//
//  ExpenseSection+CoreDataProperties.swift
//  iOS-EVAL-4
//
//  Created by Student06 on 09/09/2021.
//
//

import Foundation
import CoreData


extension ExpenseSection {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ExpenseSection> {
        return NSFetchRequest<ExpenseSection>(entityName: "ExpenseSection")
    }

    @NSManaged public var name: String?
    @NSManaged public var expenses: NSSet?

}

// MARK: Generated accessors for expenses
extension ExpenseSection {

    @objc(addExpensesObject:)
    @NSManaged public func addToExpenses(_ value: Expense)

    @objc(removeExpensesObject:)
    @NSManaged public func removeFromExpenses(_ value: Expense)

    @objc(addExpenses:)
    @NSManaged public func addToExpenses(_ values: NSSet)

    @objc(removeExpenses:)
    @NSManaged public func removeFromExpenses(_ values: NSSet)

}

extension ExpenseSection : Identifiable {

}
