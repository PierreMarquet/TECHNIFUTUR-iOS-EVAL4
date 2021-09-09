//
//  ViewController.swift
//  iOS-EVAL-4
//
//  Created by Student06 on 09/09/2021.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var expensesTableView: UITableView!
    
    var expenseSection = [ExpenseSection]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
        if !UserDefaultManager.shared.dataFilled {
            ExpensesManager.shared.fillData()
        }
        
        expenseSection = ExpensesManager.shared.fetchData()
        
        expensesTableView.delegate = self
        expensesTableView.dataSource = self
        expensesTableView.register(UINib(nibName: ExpenseTableViewCell.cellIdentifier, bundle: nil),
            forCellReuseIdentifier: ExpenseTableViewCell.cellIdentifier)
    }
    
//    @IBAction func onAddClicked(_ sender: Any) {
//        guard let viewController = storyboard?.instantiateViewController(withIdentifier: AddExpenseViewController.storyboardId) as? AddExpenseViewController else {
//            return
//        }
//        
//        viewController.delegate = self
//        viewController.modalPresentationStyle = .overFullScreen
//        self.present(viewController, animated: true, completion: nil)
//    }
    
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
   
    func numberOfSections(in tableView: UITableView) -> Int {
        return expenseSection.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return expenseSection[section].name
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expenseSection[section].expenses?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = expensesTableView.dequeueReusableCell(withIdentifier:
            ExpenseTableViewCell.cellIdentifier, for: indexPath) as! ExpenseTableViewCell
        
        if let expense = (expenseSection[indexPath.section].expenses?.sortedArray(using:
            [NSSortDescriptor(key: "name", ascending: true)]) as? [Expense])?[indexPath.row] {
            cell.setupCell(expense: expense)
        }
        return cell
       }

}
