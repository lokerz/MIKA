//
//  SearchDoctorTableViewCell.swift
//  MIKA
//
//  Created by Ridwan on 18/12/21.
//

import UIKit

class SearchDoctorTableViewCell: UITableViewCell {
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var hospitalLabel: UILabel!
    @IBOutlet weak var aboutLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    func setupUI(){
        selectionStyle = .none
        cardView.layer.cornerRadius = 8
        cardView.layer.shadowColor = UIColor.gray.cgColor
        cardView.layer.shadowOpacity = 0.5
        cardView.layer.shadowOffset = .zero
        cardView.layer.shadowRadius = 5
    }
    func configureUI(_ doctor: Doctor) {
        nameLabel.text = doctor.name
        if let hospital = doctor.hospital?.first?.name, let job = doctor.overview {
            hospitalLabel.text = hospital + " - " + job
        } else {
            hospitalLabel.text = doctor.overview
        }
        aboutLabel.text = doctor.aboutString
        priceLabel.text = doctor.price?.formatted
        photoView.loadFromURL(url: doctor.photo?.formats?.thumbnail)
    }
}
