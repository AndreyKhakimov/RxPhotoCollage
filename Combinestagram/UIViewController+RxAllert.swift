//
//  UIViewController+RxAllert.swift
//  Combinestagram
//
//  Created by Andrey Khakimov on 24.08.2022.
//  Copyright © 2022 Underplot ltd. All rights reserved.
//

import UIKit
import RxSwift

extension UIViewController {
  func presentAlert(with title: String, and message: String?) -> Completable {
    return Completable.create { [weak self] completable in
      let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
      alert.addAction(UIAlertAction(title: "Close", style: .default, handler: { _ in
        completable(.completed)
      }))
      self?.present(alert, animated: true, completion: nil)
      return Disposables.create {
        self?.dismiss(animated: true, completion: nil)
      }
    }
  }
}
