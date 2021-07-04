//
//  CommentTableViewCell.swift
//  Testovoe
//
//  Created by Rasikon on 04.07.2021.
//

import UIKit

class CommentTableViewCell: UITableViewCell {
    
    // MARK: Outlets
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    // MARK: Public methods
    
    func configure(with comment: Comment?) {
        bodyLabel.lineBreakMode = .byWordWrapping
        nameLabel.text = "NAME: \(comment?.name ?? "")"
        emailLabel.text = "EMAIL: \(comment?.email ?? "")"
        bodyLabel.text = "COMMENT: \(comment?.body ?? "")"
    }
}
