//
//  SearchDoctorViewController.swift
//  MIKA
//
//  Created by Ridwan on 18/12/21.
//

import UIKit

class SearchDoctorViewController: UIViewController {
    var viewModel : SearchDoctorViewModelProtocol?
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var containerSearch: UIStackView!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var separatorView: UIView!
    @IBOutlet weak var headerViewHeight: NSLayoutConstraint!
    @IBOutlet weak var searchTextView: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupDelegate()
        self.setupUI()
    }
    private func setupDelegate(){
        searchTextView.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
    }
    private func setupUI(){
        let image = UIImage(named: "ic_MIKA")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        navigationItem.titleView = imageView
        
        containerSearch.layer.cornerRadius = 12
        containerSearch.layer.masksToBounds = true
        containerSearch.layer.borderWidth = 1
        containerSearch.layer.borderColor = UIColor.lightGray.cgColor
        
        headerViewHeight.constant = self.view.frame.height
        separatorView.isHidden = true
        
    }
    private func setHeaderHeight(_ height: CGFloat){
        headerViewHeight.constant = height
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
        }, completion: { _ in
            self.separatorView.isHidden = false
        })
    }
    @IBAction func filterAction(_ sender: Any) {
        
    }
    @IBAction func searchAction(_ sender: Any) {
        guard let text = searchTextView.text, text != "" else {return}
        viewModel?.fetchDoctorList(key: text)
        searchTextView.resignFirstResponder()
    }
}

extension SearchDoctorViewController: SearchDoctorViewControllerProtocol {
    func refreshData() {
        self.tableView.reloadData()
    }
}

extension SearchDoctorViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.getDoctorList().count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        if let list = viewModel?.getDoctorList() {
            cell.textLabel?.text = list[indexPath.row].name
        }
        return cell
    }
    
}

extension SearchDoctorViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        setHeaderHeight(80)
        return true
    }
}
