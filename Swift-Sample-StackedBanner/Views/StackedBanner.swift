//
//  StackedBanner.swift
//  Swift-Sample-StackedBanner
//
//  Created by nobuy on 2020/11/25.
//

import UIKit

class StackedBanner: UIView {
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        return stackView
    }()
    private var banners: [UIView]?

    init() {
        super.init(frame: .zero)
        clipsToBounds = true
        backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 20)
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func show(views: [UIView]) {
        if let _ = banners {
            return
        }
        banners = views
        views.forEach { [weak self] view in
            view.isHidden = true
            self?.stackView.addArrangedSubview(view)
        }
        append(views: views, of: views.count - 1, completion: { [weak self] in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self?.hide()
            }
        })
    }

    func hide() {
        guard let banners = banners else {
            return
        }
        pop(views: banners, of: 0)
        self.banners = nil
    }

    private func append(views: [UIView], of index: Int, completion: (() -> Void)? = nil) {
        guard views.indices.contains(index) else {
            completion?()
            return
        }
        views[index].alpha = 0
        views[index].isHidden = true
        UIView.animate(withDuration: 1.0, delay: 0, options: [.curveLinear], animations: {
            views[index].isHidden = false
            views[index].alpha = 1
        }, completion: { [weak self] _ in
            self?.append(views: views, of: index - 1, completion: completion)
        })
    }

    private func pop(views: [UIView], of index: Int) {
        guard views.indices.contains(index) else {
            return
        }
        UIView.animate(withDuration: 0.25, delay: 0, options: [.curveLinear], animations: {
            views[index].isHidden = true
            views[index].alpha = 0
        }, completion: { [weak self] _ in
            self?.pop(views: views, of: index + 1)
        })
    }
}
