//
//  ViewController.swift
//  Swift-Sample-StackedBanner
//
//  Created by nobuy on 2020/11/25.
//

import UIKit

class ViewController: UIViewController {
    private lazy var button: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("描画", for: UIControl.State())
        button.setTitleColor(.black, for: UIControl.State())
        return button
    }()
    private lazy var stackedBanner = StackedBanner()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        button.addTarget(self, action: #selector(onButtonTapped(_ :)), for: .touchUpInside)

        view.addSubview(stackedBanner)
        stackedBanner.translatesAutoresizingMaskIntoConstraints = false
        stackedBanner.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        stackedBanner.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        stackedBanner.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        stackedBanner.widthAnchor.constraint(equalToConstant: view.bounds.size.width).isActive = true

        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }

    @objc func onButtonTapped(_ sender: UIButton) {
        showBanner()
    }

    private func showBanner() {
        let image = UIImage(systemName: "multiply.circle.fill")!
        let size = CGSize(width: view.bounds.size.width, height: 80)
        let views: [UIView] = [
            Banner(image: image,
                   mainText: "メインテキストメインテキスト3",
                   subText: "サブテキスト",
                   size: size),
            Banner(image: image,
                   mainText: "メインテキストメインテキスト2",
                   subText: "サブテキスト",
                   size: size),
            Banner(image: image,
                   mainText: "メインテキストメインテキスト1",
                   subText: "サブテキスト",
                   size: size)
        ]
        stackedBanner.show(views: views)
    }
}

