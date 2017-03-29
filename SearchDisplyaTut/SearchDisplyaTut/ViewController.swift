//
//  ViewController.swift
//  SearchDisplyaTut
//
//  Created by Phadatare, Shankar (Syntel) on 3/29/17.
//  Copyright © 2017 Phadatare, Shankar (Syntel). All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate,UISearchBarDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var friendsArray = [FriendItem]()
    
    var filleterdFriendsArray = [FriendItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        friendsArray += [FriendItem(name: "Apple")];
        friendsArray += [FriendItem(name: "Microsoft")];
        friendsArray += [FriendItem(name: "iPhone")];
        friendsArray += [FriendItem(name: "iPad")];
        friendsArray += [FriendItem(name: "AllState")];
        friendsArray += [FriendItem(name: "Syntel")];
        
        
        for value in 1...100
        {
            friendsArray += ([FriendItem(name: String(value) as NSString)]);

        }
        
        self.filleterdFriendsArray += friendsArray;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    //MARK - TableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filleterdFriendsArray.count
    }
    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 100
//    }
//    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let view = UIView.init(frame: CGRect.init(x: 0, y: 0, width: self.tableView.frame.size.width, height: 100))
//        view.backgroundColor = UIColor.red
//        return view
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        var cell = tableView.dequeueReusableCell(withIdentifier: "basiccell")
        
        if(cell == nil)
        {
            cell = UITableViewCell(style: UITableViewCellStyle.default,reuseIdentifier:"basiccell" as String)
        }
        
        var friend: FriendItem
        
        friend = filleterdFriendsArray[indexPath.row];
        cell?.textLabel?.text = friend.name as String
        
        return cell!
    }
    
    func filteredContetOfSerachText(searchString:String, scope:String = "Title")  {
        
        self.filleterdFriendsArray = self.friendsArray.filter({ (friendItem) -> Bool in
            return friendItem.name.contains(searchString);
        })
    }
    
    
    func updateSearchResults(for searchController: UISearchController)
    {
        if let searchText = searchController.searchBar.text, !searchText.isEmpty {
            
            self.filteredContetOfSerachText(searchString: searchText)
            
        }
        tableView.reloadData()
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) 
    {
        if let searchText = searchBar.text, !searchText.isEmpty {
            
            self.filteredContetOfSerachText(searchString: searchText)
            
        }else{
            self.resetResultArray()
        }
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
        self.resetResultArray()
    }
    
    func resetResultArray()  {
        self.filleterdFriendsArray += self.friendsArray
        tableView.reloadData()
    }

}

