//
//  SitesTableViewController.swift
//  AbaoTravelLocationProject
//
//  This table view mainly handles the site to show to the user, and do all the search bar feature
//  This table view controller is connected to Site.swift
//
//  Created by Alesson Abao on 10/7/22 for mobile application development project
//

import UIKit

class SitesTableViewController: UITableViewController, UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        // this is the user input from the searchbar
        guard let text = searchController.searchBar.text else { return }
        // if the user doesn't search anything, all sites will be shown
        if(text.isEmpty == true)
        {
            filteredSites = sites
        }
        else
        {
            // we want the placeholder of filtered results to be empty once search happens
            filteredSites = []
            // loop through each array object [array 1 = sitename, site address, ...]
            for arrayElement in sites
            {
                if(arrayElement.siteName.lowercased().contains(text.lowercased()) || arrayElement.siteAddress.lowercased().contains(text.lowercased()) || arrayElement.siteDescription.lowercased().contains(text.lowercased()) ||
                   arrayElement.dateSaved.lowercased().contains(text.lowercased()))
                {
                    // add the array in a placeholder
                    filteredSites.append(arrayElement)
                }
            }
        }
        // refresh search
        tableView.reloadData()
    }
    
    // variable to the current data
    let sites = readData()
    // placeholder for the searched sites
    var filteredSites = [Site]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // create a search controller (search bar) and assign it to the current view controller
        let search = UISearchController(searchResultsController: nil)
        search.searchResultsUpdater = self
        search.obscuresBackgroundDuringPresentation = false
        search.searchBar.placeholder = "Search site by name, address, description or date saved"
        navigationItem.searchController = search
        // you want to make filteredSites be the same as the current site list
        filteredSites = sites
    }
    
    // determines how many site will show up, rows = number of sites
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredSites.count
    }
    
    // what to show in each row, 1 row will show name + pic
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SiteTableViewCell

        cell.nameLabel.text = filteredSites[indexPath.row].siteName
        cell.picView.image = filteredSites[indexPath.row].siteImg

        return cell
    }
    
    // if row is selected, show name, address, pic, and description in SiteDetailsViewController.swift
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "show", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "show")
        {
            let indexPath = self.tableView.indexPathForSelectedRow!
            let tableViewDetail = segue.destination as? SiteDetailsViewController
            
            let selectedSite = filteredSites[indexPath.row]
            
            tableViewDetail!.selectedSite = selectedSite
            
            self.tableView.deselectRow(at: indexPath, animated: true)
        }
    }
}
