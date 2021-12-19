//
//  FilterViewController.swift
//  MIKA
//
//  Created by Ridwan on 19/12/21.
//

import UIKit

class FilterViewController: BaseUIViewController {
    var viewModel : FilterViewModelProtocol?
    @IBOutlet var bgView: UIView!
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var tableHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegate()
    }
    override func setupUI(){
        super.setupUI()
        cardView.layer.cornerRadius = 12
        cardView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        cancelButton.layer.borderWidth = 1
        cancelButton.layer.borderColor = UIColor(named: "AccentColor")?.cgColor
        bgView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissMyself)))
    }
    func setupDelegate(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    @IBAction func cancelAction(_ sender: Any) {
        self.dismissMyself()
    }
    @IBAction func applyAction(_ sender: Any) {
        self.dismissMyselfAnd(onFinished:{
            self.viewModel?.doSave()
        })
    }
    private func updateHeight(_ count: Int) {
        tableHeight.constant = CGFloat(count * 50)
        view.layoutIfNeeded()
    }
}

extension FilterViewController: FilterViewControllerProtocol {
    func refreshTable() {
        tableView.reloadData()
    }
}

extension FilterViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = viewModel?.filters.count {
            updateHeight(count)
            return count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 48
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        if let item = viewModel?.filters[indexPath.row] {
            cell.textLabel?.text = item
            cell.selectionStyle = .none
            if let selectedFilter = viewModel?.selectedFilters, selectedFilter.contains(item) {
                cell.accessoryType = .checkmark
            } else {
                cell.accessoryType = .none
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel?.selectItem(at: indexPath)
    }
}
