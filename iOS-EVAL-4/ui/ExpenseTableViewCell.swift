//
//  ExpenseTableViewCell.swift
//  iOS-EVAL-4
//
//  Created by Student06 on 09/09/2021.
//

import UIKit

class ExpenseTableViewCell: UITableViewCell {
    static let cellIdentifier = "ExpenseTableViewCell"
    
    @IBOutlet weak var expenseNameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(expense: Expense){
        expenseNameLabel.text = expense.name
    }
    
}
