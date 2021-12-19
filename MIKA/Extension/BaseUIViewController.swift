//
//  BaseUIViewController.swift
//  MIKA
//
//  Created by Ridwan on 18/12/21.
//

import Foundation
import UIKit

class BaseUIViewController: UIViewController, NavigatingProtocol {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    func setupUI(){
        let image = UIImage(named: "ic_MIKA")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        navigationItem.titleView = imageView
    }
}

extension UIViewController {
    @objc func dismissMyself() {
        guard let nav = navigationController else {
            self.dismiss(animated: true, completion: nil)
            return
        }
        if nav.viewControllers.count == 1 {
            nav.dismiss(animated: true, completion: nil)
        } else {
            nav.popViewController(animated: true)
        }
    }
    @objc func dismissMyselfAnd(onFinished: (() -> Void)?) {
        guard let nav = navigationController else {
            self.dismiss(animated: true) { onFinished?() }
            return
        }
        if nav.viewControllers.count == 1 {
            self.dismiss(animated: true) { onFinished?() }
        } else {
            nav.popViewController(animated: true)
            onFinished?()
        }
    }
}
