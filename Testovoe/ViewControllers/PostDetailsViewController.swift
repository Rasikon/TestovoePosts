//
//  PostDetailsViewController.swift
//  Testovoe
//
//  Created by Rasikon on 04.07.2021.
//

import UIKit

class PostDetailsViewController: UIViewController {
    
    // MARK: Outlets
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Public properties
    
    var post: Post!
    
    // MARK: Private properties
    
    private var comments: [Comment] = []
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        loadData()
        
        titleLabel.text = post.title
        detailLabel.text = post.body
        titleLabel.lineBreakMode = .byWordWrapping
        detailLabel.lineBreakMode  = .byWordWrapping
        
    }
    
    // MARK: Private methods
    
    private func loadData() {
        let urlString = "https://jsonplaceholder.typicode.com/posts/\(post.id)/comments"
        let manager = NetworkManager<Comment>()
        manager.fetchData(from: urlString) { comments in
            self.comments = comments
            self.tableView.reloadData()
        }
    }
}

// MARK: Extension for UITableView data source

extension PostDetailsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "commentCell", for: indexPath) as! CommentTableViewCell
        
        let comment = comments[indexPath.row]
        cell.configure(with: comment)
        return cell
    }
}
