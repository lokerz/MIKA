//
//  NavigatingProtocol.swift
//  MIKA
//
//  Created by Ridwan on 19/12/21.
//

import Foundation
import UIKit

enum NavigationType {
    case push
    case pushAsRoot
    case pushAsFinal
    case popAsRoot
    case present
    case presentOverFullscreen(_ transition: UIModalTransitionStyle)
    case presentAsSheet
    case dismiss
    case becomeRoot
    
    func isPresentingNavigation() -> Bool {
        switch self {
        case .present, .presentOverFullscreen, .presentAsSheet: return true
        default: return false
        }
    }

}

protocol NavigatingProtocol: UIViewController {}

extension NavigatingProtocol {
    func navigateBack() {
        var nav: UINavigationController?
        if let meNav = self as? UINavigationController {
            nav = meNav
        } else if let myNav = self.navigationController {
            nav = myNav
        }
        nav?.popViewController(animated: true)
    }
    func navigateToRoot() {
        var nav: UINavigationController?
        if let meNav = self as? UINavigationController {
            nav = meNav
        } else if let myNav = self.navigationController {
            nav = myNav
        }
        nav?.popToRootViewController(animated: true)
    }
    func navigateOpenURL(url: String) {
        guard let url = URL(string: url) else {return}
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    func navigateTo(_ module: UIViewController, mode: NavigationType) {
        if let presenter = self.presentingViewController as? NavigatingProtocol, !mode.isPresentingNavigation() {
            self.dismiss(animated: true) {
                presenter.navigateTo(module, mode: mode)
            }
            return
        }
        var nav: UINavigationController?
        if let meNav = self as? UINavigationController {
            nav = meNav
        } else if let myNav = self.navigationController {
            nav = myNav
        }
        if nav == nil {
            if let master = self.presentingViewController {
                if let navMaster = master as? UINavigationController {
                    nav = navMaster
                } else {
                    nav = master.navigationController
                }
            }
        }
        switch mode {
        case .becomeRoot:
            if let content = nav?.viewControllers, content.count > 1 {
                if self != nav {
                    nav?.setViewControllers([self], animated: true)
                }
            }
        case .dismiss:
            self.dismissMyself()
        case .present:
            self.present(module, animated: true, completion: nil)
        case .presentOverFullscreen(let transition):
            module.modalTransitionStyle = transition
            module.modalPresentationStyle = .overFullScreen
            self.present(module, animated: true, completion: nil)
        case .presentAsSheet:
            if #available(iOS 13, *) {
                module.modalTransitionStyle = .coverVertical
                module.modalPresentationStyle = .pageSheet
            } else {
                module.modalTransitionStyle = .coverVertical
                module.modalPresentationStyle = .overFullScreen
            }
            self.present(module, animated: true, completion: nil)
        case .push:
            nav?.pushViewController(module, animated: true)
        case .pushAsRoot:
            nav?.setViewControllers([module], animated: true)
        case .pushAsFinal:
            if var content = nav?.viewControllers, !content.contains(module) {
                if let first = content.first {
                    content = [first]
                }
                content.append(module)
                nav?.setViewControllers(content, animated: true)
            }
        case .popAsRoot:
            if var content = nav?.viewControllers, !content.contains(module) {
                content.insert(module, at: 0)
                nav?.setViewControllers(content, animated: false)
                nav?.popToRootViewController(animated: true)
            }
        }
    }
}
