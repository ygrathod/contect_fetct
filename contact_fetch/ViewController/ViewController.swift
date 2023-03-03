//
//  ViewController.swift
//  contact_fetch
//
//  Created by Yuvrajsinh on 10/11/22.
//

import UIKit
import Contacts

class ViewController: UIViewController {

    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var tblView: UITableView!
    var contactVM = ContactViewModel()
    let refreshControl = UIRefreshControl()
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        navBar.topItem?.title = Constants.NAV_TITLE_CONTACTLIST
        fetchAndGetData()
        // Do any additional setup after loading the view.
    }
    func fetchAndGetData() {
        showSpiner()
        contactVM.fetchContact()
        contactVM.getContract()
        hideSpiner()
    }
    
// setTableView for UITableview and set table cell register
    func setTableView() {
        self.tblView.delegate = self
        self.tblView.dataSource = self
        self.tblView.register(UINib(nibName: Constants.CONTECTLIST_TBL_CELL_IDENTIFIRE, bundle: nil), forCellReuseIdentifier: Constants.CONTECTLIST_TBL_CELL_IDENTIFIRE)
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        tblView.addSubview(refreshControl)
    }
    
    

    @objc func refresh(_ sender: AnyObject) {
        contactVM.contectList.removeAll()
        fetchAndGetData()
        refreshControl.endRefreshing()
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    // table cell count
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactVM.contectList.count
    }
    // tableview cell 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellValue = contactVM.contectList[indexPath.row]
        let contactListCell = self.tblView.dequeueReusableCell(withIdentifier: Constants.CONTECTLIST_TBL_CELL_IDENTIFIRE) as! ContactTableViewCell
        contactListCell.lblName.text = cellValue.name
        contactListCell.lblNumber.text = cellValue.number
        contactListCell.imgUser.image = (cellValue.image != nil) ? UIImage(data: cellValue.image!) :UIImage(named: Constants.PLACEHOLDER_IMG)
        return contactListCell
    }
    
    
}
