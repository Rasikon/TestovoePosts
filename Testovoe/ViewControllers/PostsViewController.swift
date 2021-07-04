//
//  PostsViewController.swift
//  Testovoe
//
//  Created by Rasikon on 04.07.2021.
//

import UIKit

class PostsViewController: UITableViewController {
    
    // MARK: Private properties
    
    private let urlString = "https://jsonplaceholder.typicode.com/posts"
    private var posts: [Post] = []
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
    // MARK: Private methods
    
    private func loadData() {
        let manager = NetworkManager<Post>()
        manager.fetchData(from: urlString) { posts in
            self.posts = posts
            self.tableView.reloadData()
        }
    }
    
    // MARK: UITableView data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath)
        let post = posts[indexPath.row]
        cell.textLabel?.lineBreakMode = .byWordWrapping
        cell.detailTextLabel?.lineBreakMode  = .byWordWrapping
        cell.textLabel?.text = "TITLE:\n\(post.title)\n"
        cell.detailTextLabel?.text = "DETAIL:\n\(post.body)"
        return cell
    }
    
    // MARK: UITableView delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let post = posts[indexPath.row]
        let postDetailsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PostDetailsViewController") as! PostDetailsViewController
        postDetailsVC.post = post
        navigationController?.pushViewController(postDetailsVC, animated: true)
    }
}


