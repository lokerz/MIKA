//
//  SearchDoctorViewController.swift
//  MIKA
//
//  Created by Ridwan on 18/12/21.
//

import UIKit

class SearchDoctorViewController: BaseUIViewController {
    var viewModel : SearchDoctorViewModelProtocol?
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var containerSearch: UIStackView!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var separatorView: UIView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var containerFilter: UIStackView!
    @IBOutlet weak var emptyView: UIView!
    @IBOutlet weak var hospitalButton: UIButton!
    @IBOutlet weak var specializationButton: UIButton!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegate()
    }
    private func setupDelegate(){
        searchTextField.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
    }
    override func setupUI(){
        super.setupUI()
        
        containerSearch.layer.cornerRadius = 8
        containerSearch.layer.masksToBounds = true
        containerSearch.layer.borderWidth = 1
        containerSearch.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.5).cgColor
        
        separatorView.isHidden = false
        containerFilter.isHidden = true
        
        tableView.register(SearchDoctorTableViewCell().nib(), forCellReuseIdentifier: SearchDoctorTableViewCell().nibName())
        
    }
    @IBAction func filterAction(_ sender: Any) {
        containerFilter.isHidden = !containerFilter.isHidden
    }
    @IBAction func searchAction(_ sender: Any) {
        guard let name = searchTextField.text else {return}
        searchTextField.resignFirstResponder()
        viewModel?.doSearch(name)
    }
    @IBAction func hospitalAction(_ sender: Any) {
        viewModel?.doHospital()
    }
    @IBAction func specializationAction(_ sender: Any) {
        viewModel?.doSpecialization()
    }
}

extension SearchDoctorViewController: SearchDoctorViewControllerProtocol {
    func refreshData() {
        tableView.reloadData()
    }
    func setEmptyView(_ hidden: Bool) {
        emptyView.isHidden = hidden
    }
    func getName() -> String {
        return searchTextField.text ?? ""
    }
    func showLoading(_ state: Bool){
        if state {
            loadingIndicator.startAnimating()
        } else {
            loadingIndicator.stopAnimating()
        }
    }
}

extension SearchDoctorViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.doctors?.count ?? 0
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchDoctorTableViewCell().nibName()) as? SearchDoctorTableViewCell
        if let doctor = viewModel?.doctors?[indexPath.row]{
            cell?.configureUI(doctor)
        }
        return cell ?? UITableViewCell()
    }
}

extension SearchDoctorViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
}
