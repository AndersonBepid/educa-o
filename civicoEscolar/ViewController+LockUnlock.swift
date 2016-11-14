//
//  ViewController+LockUnlock.swift
//  lockview
//
//  Created by Vilar da Camara Neto on 16-06-20.
//  Copyright © 2016 Vilar da Camara Neto. All rights reserved.
//

import UIKit


extension UIViewController {
    func getLockBlurSubview() -> UIVisualEffectView {
        for subview in self.view.subviews {
            if let visualEffectView = subview as? UIVisualEffectView {
                return visualEffectView
            }
        }

        let visualEffectSubview = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
        visualEffectSubview.translatesAutoresizingMaskIntoConstraints = false
        visualEffectSubview.alpha = 0

        self.view.addSubview(visualEffectSubview)
        self.view.addConstraint(NSLayoutConstraint(item: visualEffectSubview, attribute: .left, relatedBy: .equal, toItem: self.view, attribute: .left, multiplier: 1, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: visualEffectSubview, attribute: .right, relatedBy: .equal, toItem: self.view, attribute: .right, multiplier: 1, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: visualEffectSubview, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: visualEffectSubview, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1, constant: 0))

        return visualEffectSubview
    }

    func getLockSpinningView() -> UIActivityIndicatorView {
        for subview in self.view.subviews {
            if let activityIndicatorView = subview as? UIActivityIndicatorView {
                return activityIndicatorView
            }
        }

        let activityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        activityIndicatorView.startAnimating()

        self.view.addSubview(activityIndicatorView)
        self.view.addConstraint(NSLayoutConstraint(item: activityIndicatorView, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: activityIndicatorView, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1, constant: 0))

        return activityIndicatorView
    }

    func lock() {
        let visualEffectView = self.getLockBlurSubview()
        let activityIndicatorView = self.getLockSpinningView()

        UIView.animate(withDuration: 0.3, animations: {
            visualEffectView.alpha = 1
            activityIndicatorView.alpha = 1
        })
    }

    func unlock() {
        let visualEffectView = self.getLockBlurSubview()
        let activityIndicatorView = self.getLockSpinningView()

        UIView.animate(withDuration: 0.3, animations: {
            visualEffectView.alpha = 0
            activityIndicatorView.alpha = 0
        })
    }
}
