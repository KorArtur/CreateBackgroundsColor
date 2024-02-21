//
//  HomeViewController.swift
//  CreateBackgroundsColor
//
//  Created by Карина Короткая on 21.02.2024.
//

import UIKit

protocol SettingsViewControllerDelegate: AnyObject {
    func changeColor(_ color: UIColor?)
}

final class HomeViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let settingsVC = segue.destination as? SettingsViewController
        settingsVC?.viewColor = view.backgroundColor
        settingsVC?.delegate = self
    }
}

// MARK: SettingsViewControllerDelegate
extension HomeViewController: SettingsViewControllerDelegate {
    func changeColor(_ color: UIColor?) {
        view.backgroundColor = color
    }
}
