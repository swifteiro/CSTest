//
//  RepositoriesViewController.swift
//  ConcreteTest
//
//  Created by Vinicius on 11/09/16.
//  Copyright © 2016 vm. All rights reserved.
//

import UIKit
import SVProgressHUD

class RepositoriesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let repositoriesRep = RepositoriesViewModel() as RepositoriesRepresentation
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        self.getRepos()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: UITableViewDelegate/Datasource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.repositoriesRep.arrayRepo.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("RepoCell", forIndexPath: indexPath) as? RepoCell
        self.tableView(tableView, willDisplayCell: cell!, forRowAtIndexPath: indexPath)
        return cell!
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        if self.repositoriesRep.arrayRepo.count > 0 {
            let repoCell = cell as? RepoCell
            let repos :RepositoriresModel = self.repositoriesRep.arrayRepo[indexPath.row]
            let repoCellModelView = RepoCellModelView(repos: repos)
            repoCell?.setupCell(repoCellModelView)
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    
    //MARK: GET REPOS
    func getRepos() {
        SVProgressHUD.show()
        self.repositoriesRep.getRepos({ () in
            SVProgressHUD.dismiss()
            dispatch_async(dispatch_get_main_queue()) {
                self.tableView.reloadData()
            }
        }) { (stringError) in
            SVProgressHUD.dismiss()
            let alert = UIAlertController(title: ThemeApp.alertTitle, message: stringError, preferredStyle: UIAlertControllerStyle.Alert)
            let okAction = UIAlertAction(title: ThemeApp.alertTitleButtonOk, style: UIAlertActionStyle.Default) {
                UIAlertAction in
            }
            alert.addAction(okAction)
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
}
