//
//  Constraints.swift
//
//
//  Created by Aleksandr Kolosov on 08.09.2024.
//

import UIKit

public extension UIView {
    func addSubviews(_ subviews: UIView...) {
        for subview in subviews where subview.superview == nil {
            addSubview(subview)
        }
    }
}

// MARK: - Constraints
public extension UIView {
    @discardableResult
    func pinToSuperview(insets: UIEdgeInsets = .zero) -> EdgeConstraints? {
        guard let superview = self.superview else {
            return nil
        }
        translatesAutoresizingMaskIntoConstraints = false
        let top = top(to: superview, offset: insets.top)
        let leading = leading(to: superview, offset: insets.left)
        let trailing = trailing(to: superview, inset: insets.right)
        let bottom = bottom(to: superview, inset: insets.bottom)
        NSLayoutConstraint.activate([top, leading, trailing, bottom])
        return EdgeConstraints(top: top, leading: leading, trailing: trailing, bottom: bottom)
    }
    
    func pinToSuperviewBottom(
        insets: UIEdgeInsets = .zero,
        ignoringSafeArea: Bool = false,
        height: CGFloat
    ) {
        guard let superview = self.superview else {
            return
        }
        translatesAutoresizingMaskIntoConstraints = false
        let heightConstraint: NSLayoutConstraint = self.height(height)
        let leading = leading(to: superview, offset: insets.left)
        let trailing = trailing(to: superview, inset: insets.right)
        let bottom = bottom(
            ignoringSafeArea ? superview.bottomAnchor : superview.safeAreaLayoutGuide.bottomAnchor,
            inset: insets.bottom
        )
        NSLayoutConstraint.activate([heightConstraint, leading, trailing, bottom])
    }
    
    func top(_ anchor: NSLayoutYAxisAnchor, offset: CGFloat = 0) -> NSLayoutConstraint {
        topAnchor.constraint(equalTo: anchor, constant: offset)
    }
    
    func top(_ anchor: NSLayoutYAxisAnchor, inset: CGFloat) -> NSLayoutConstraint {
        topAnchor.constraint(equalTo: anchor, constant: -inset)
    }
    
    func top(to layoutGuide: UILayoutGuide, offset: CGFloat = 0) -> NSLayoutConstraint {
        topAnchor.constraint(equalTo: layoutGuide.topAnchor, constant: offset)
    }
    
    func top(to layoutGuide: UILayoutGuide, inset: CGFloat) -> NSLayoutConstraint {
        topAnchor.constraint(equalTo: layoutGuide.topAnchor, constant: -inset)
    }
    
    func top(to view: UIView, offset: CGFloat = 0) -> NSLayoutConstraint {
        topAnchor.constraint(equalTo: view.topAnchor, constant: offset)
    }
    
    func top(to view: UIView, inset: CGFloat) -> NSLayoutConstraint {
        topAnchor.constraint(equalTo: view.topAnchor, constant: -inset)
    }

    func bottom(_ anchor: NSLayoutYAxisAnchor, offset: CGFloat = 0) -> NSLayoutConstraint {
        bottomAnchor.constraint(equalTo: anchor, constant: offset)
    }
    
    func bottom(_ anchor: NSLayoutYAxisAnchor, inset: CGFloat) -> NSLayoutConstraint {
        bottomAnchor.constraint(equalTo: anchor, constant: -inset)
    }
    
    func bottom(to layoutGuide: UILayoutGuide, offset: CGFloat = 0) -> NSLayoutConstraint {
        bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor, constant: offset)
    }
    
    func bottom(to layoutGuide: UILayoutGuide, inset: CGFloat) -> NSLayoutConstraint {
        bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor, constant: -inset)
    }
    
    func bottom(to view: UIView, offset: CGFloat = 0) -> NSLayoutConstraint {
        bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: offset)
    }
    
    func bottom(to view: UIView, inset: CGFloat) -> NSLayoutConstraint {
        bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -inset)
    }
    
    func leading(_ anchor: NSLayoutXAxisAnchor, offset: CGFloat = 0) -> NSLayoutConstraint {
        leadingAnchor.constraint(equalTo: anchor, constant: offset)
    }
    
    func leading(_ anchor: NSLayoutXAxisAnchor, inset: CGFloat) -> NSLayoutConstraint {
        leadingAnchor.constraint(equalTo: anchor, constant: -inset)
    }
    
    func leading(to layoutGuide: UILayoutGuide, offset: CGFloat = 0) -> NSLayoutConstraint {
        leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor, constant: offset)
    }
    
    func leading(to layoutGuide: UILayoutGuide, inset: CGFloat) -> NSLayoutConstraint {
        leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor, constant: -inset)
    }
    
    func leading(to view: UIView, offset: CGFloat = 0) -> NSLayoutConstraint {
        leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: offset)
    }
    
    func leading(to view: UIView, inset: CGFloat) -> NSLayoutConstraint {
        leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -inset)
    }
    
    func trailing(_ anchor: NSLayoutXAxisAnchor, offset: CGFloat = 0) -> NSLayoutConstraint {
        trailingAnchor.constraint(equalTo: anchor, constant: offset)
    }
    
    func trailing(_ anchor: NSLayoutXAxisAnchor, inset: CGFloat) -> NSLayoutConstraint {
        trailingAnchor.constraint(equalTo: anchor, constant: -inset)
    }
    
    func trailing(to layoutGuide: UILayoutGuide, offset: CGFloat = 0) -> NSLayoutConstraint {
        trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor, constant: offset)
    }
    
    func trailing(to layoutGuide: UILayoutGuide, inset: CGFloat) -> NSLayoutConstraint {
        trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor, constant: -inset)
    }
    
    func trailing(to view: UIView, offset: CGFloat = 0) -> NSLayoutConstraint {
        trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: offset)
    }
    
    func trailing(to view: UIView, inset: CGFloat) -> NSLayoutConstraint {
        trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -inset)
    }
    
    func centerY(_ anchor: NSLayoutYAxisAnchor, offset: CGFloat = 0) -> NSLayoutConstraint {
        centerYAnchor.constraint(equalTo: anchor, constant: offset)
    }
    
    func centerY(_ anchor: NSLayoutYAxisAnchor, inset: CGFloat) -> NSLayoutConstraint {
        centerYAnchor.constraint(equalTo: anchor, constant: -inset)
    }
    
    func centerY(to layoutGuide: UILayoutGuide, offset: CGFloat = 0) -> NSLayoutConstraint {
        centerYAnchor.constraint(equalTo: layoutGuide.centerYAnchor, constant: offset)
    }
    
    func centerY(to layoutGuide: UILayoutGuide, inset: CGFloat) -> NSLayoutConstraint {
        centerYAnchor.constraint(equalTo: layoutGuide.centerYAnchor, constant: -inset)
    }
    
    func centerY(to view: UIView, offset: CGFloat = 0) -> NSLayoutConstraint {
        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: offset)
    }
    
    func centerY(to view: UIView, inset: CGFloat) -> NSLayoutConstraint {
        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -inset)
    }
    
    func centerX(_ anchor: NSLayoutXAxisAnchor, offset: CGFloat = 0) -> NSLayoutConstraint {
        centerXAnchor.constraint(equalTo: anchor, constant: offset)
    }
    
    func centerX(_ anchor: NSLayoutXAxisAnchor, inset: CGFloat) -> NSLayoutConstraint {
        centerXAnchor.constraint(equalTo: anchor, constant: -inset)
    }
    
    func centerX(to layoutGuide: UILayoutGuide, offset: CGFloat = 0) -> NSLayoutConstraint {
        centerXAnchor.constraint(equalTo: layoutGuide.centerXAnchor, constant: offset)
    }
    
    func centerX(to layoutGuide: UILayoutGuide, inset: CGFloat) -> NSLayoutConstraint {
        centerXAnchor.constraint(equalTo: layoutGuide.centerXAnchor, constant: -inset)
    }
    
    func centerX(to view: UIView, offset: CGFloat = 0) -> NSLayoutConstraint {
        centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: offset)
    }
    
    func centerX(to view: UIView, inset: CGFloat) -> NSLayoutConstraint {
        centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -inset)
    }
    
    func height(_ constant: CGFloat) -> NSLayoutConstraint {
        heightAnchor.constraint(equalToConstant: constant)
    }
    
    func width(_ constant: CGFloat) -> NSLayoutConstraint {
        widthAnchor.constraint(equalToConstant: constant)
    }
    
    func height(sameAs view: UIView, constant: CGFloat) -> NSLayoutConstraint {
        heightAnchor.constraint(equalTo: view.heightAnchor, constant: constant)
    }
    
    func width(sameAs view: UIView, constant: CGFloat) -> NSLayoutConstraint {
        widthAnchor.constraint(equalTo: view.widthAnchor, constant: constant)
    }
    
    func width(sameAs anchor: NSLayoutDimension, constant: CGFloat) -> NSLayoutConstraint {
        widthAnchor.constraint(equalTo: anchor, constant: constant)
    }

    func top(greaterOrEqualTo anchor: NSLayoutYAxisAnchor, offset: CGFloat) -> NSLayoutConstraint {
        topAnchor.constraint(greaterThanOrEqualTo: anchor, constant: offset)
    }

    func leading(greaterOrEqualTo anchor: NSLayoutXAxisAnchor, offset: CGFloat) -> NSLayoutConstraint {
        leadingAnchor.constraint(greaterThanOrEqualTo: anchor, constant: offset)
    }

    func trailing(greaterOrEqualTo anchor: NSLayoutXAxisAnchor, offset: CGFloat) -> NSLayoutConstraint {
        trailingAnchor.constraint(greaterThanOrEqualTo: anchor, constant: offset)
    }

    func bottom(greaterOrEqualTo anchor: NSLayoutYAxisAnchor, offset: CGFloat) -> NSLayoutConstraint {
        bottomAnchor.constraint(greaterThanOrEqualTo: anchor, constant: offset)
    }
}

public extension Array where Element == NSLayoutConstraint {
    func activate() {
        NSLayoutConstraint.activate(self)
    }
}

public struct EdgeConstraints {
    let top: NSLayoutConstraint
    let leading: NSLayoutConstraint
    let trailing: NSLayoutConstraint
    let bottom: NSLayoutConstraint
    
    func setInsets(_ insets: UIEdgeInsets) {
        top.constant = insets.top
        leading.constant = insets.left
        trailing.constant = -insets.right
        bottom.constant = -insets.bottom
    }
}

