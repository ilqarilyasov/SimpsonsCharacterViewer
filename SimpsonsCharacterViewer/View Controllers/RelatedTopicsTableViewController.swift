//
//  RelatedTopicsTableViewController.swift
//  DuckDuckGo
//
//  Created by Ilgar Ilyasov on 6/8/19.
//  Copyright © 2019 IIIyasov. All rights reserved.
//

import UIKit

class RelatedTopicsTableViewController: UITableViewController {
    
    // MARK: - Properties
    
    let client = DuckDuckGoClient()
    var relatedTopics = [RelatedTopic]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    
    // MARK: - Outlets
    
    @IBOutlet weak var searchBar: UISearchBar!
    

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
    }

    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return relatedTopics.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TopicCell", for: indexPath)
        
        let topic = relatedTopics[indexPath.row]
        
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = topic.text
        
        return cell
    }
   
}
