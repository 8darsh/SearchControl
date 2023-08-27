//
//  ViewController.swift
//  SearchControl
//
//  Created by Adarsh Singh on 08/08/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, UISearchControllerDelegate {
    
    
    @IBOutlet var tableView: UITableView!
    let search = UISearchController(searchResultsController: nil)
    var arr = [String]()
    
    func arrShow(){
        arr = ["Aditya","Adarsh","Maaz","Divyam","Kartik","Harsh","Jaskeerat", "Ishika"]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = arr[indexPath.row]
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        arrShow()
        searchBarSetup()
    }
    private func searchBarSetup(){
        search.searchResultsUpdater = self
        search.searchBar.delegate = self
        navigationItem.searchController = search
    }


}
extension ViewController: UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else { return }
        if searchText == ""{
            arrShow()
        }else{
            arrShow()
            arr = arr.filter{
                $0.contains(searchText)
            }
        }
        tableView.reloadData()
    }
}

