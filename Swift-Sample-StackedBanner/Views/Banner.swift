//
//  Banner.swift
//  Swift-Sample-StackedBanner
//
//  Created by nobuy on 2020/11/25.
//

import UIKit

final class Banner: UIView {
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .clear
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    private lazy var labelContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    private lazy var subStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        return stackView
    }()
    private lazy var mainLabelContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    private lazy var mainLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .white
        return label
    }()
    private lazy var subLabelContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    private lazy var subLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .white
        return label
    }()

    init(image: UIImage, mainText: String?, subText: String?, size: CGSize) {
        super.init(frame: .zero)
        backgroundColor = .clear
        imageView.image = image
        mainLabel.text = mainText
        mainLabelContainer.isHidden = mainText == nil
        subLabel.text = subText
        subLabelContainer.isHidden = subText == nil

        labelContainer.addSubview(subStackView)
        subStackView.translatesAutoresizingMaskIntoConstraints = false
        subStackView.topAnchor.constraint(equalTo: labelContainer.topAnchor).isActive = true
        subStackView.bottomAnchor.constraint(equalTo: labelContainer.bottomAnchor).isActive = true
        subStackView.leadingAnchor.constraint(equalTo: labelContainer.leadingAnchor).isActive = true
        subStackView.trailingAnchor.constraint(equalTo: labelContainer.trailingAnchor).isActive = true

        mainLabelContainer.addSubview(mainLabel)
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        mainLabel.centerYAnchor.constraint(equalTo: mainLabelContainer.centerYAnchor).isActive = true
        mainLabel.leadingAnchor.constraint(equalTo: mainLabelContainer.leadingAnchor).isActive = true
        mainLabel.trailingAnchor.constraint(lessThanOrEqualTo: mainLabelContainer.trailingAnchor).isActive = true

        subStackView.addArrangedSubview(mainLabelContainer)
        mainLabelContainer.translatesAutoresizingMaskIntoConstraints = false
        mainLabelContainer.leadingAnchor.constraint(equalTo: subStackView.leadingAnchor).isActive = true
        mainLabelContainer.trailingAnchor.constraint(equalTo: subStackView.trailingAnchor).isActive = true
        mainLabelContainer.heightAnchor.constraint(equalToConstant: size.height / 2).isActive = true

        subLabelContainer.addSubview(subLabel)
        subLabel.translatesAutoresizingMaskIntoConstraints = false
        subLabel.centerYAnchor.constraint(equalTo: subLabelContainer.centerYAnchor).isActive = true
        subLabel.leadingAnchor.constraint(equalTo: subLabelContainer.leadingAnchor).isActive = true
        subLabel.trailingAnchor.constraint(lessThanOrEqualTo: subLabelContainer.trailingAnchor).isActive = true

        subStackView.addArrangedSubview(subLabelContainer)
        subLabelContainer.translatesAutoresizingMaskIntoConstraints = false
        subLabelContainer.leadingAnchor.constraint(equalTo: subStackView.leadingAnchor).isActive = true
        subLabelContainer.trailingAnchor.constraint(equalTo: subStackView.trailingAnchor).isActive = true
        subLabelContainer.heightAnchor.constraint(equalToConstant: size.height / 2).isActive = true

        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 64).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 64).isActive = true

        addSubview(labelContainer)
        labelContainer.translatesAutoresizingMaskIntoConstraints = false
        labelContainer.topAnchor.constraint(equalTo: topAnchor).isActive = true
        labelContainer.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        labelContainer.leadingAnchor.constraint(equalTo: imageView.trailingAnchor).isActive = true
        labelContainer.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true

        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: size.width).isActive = true
        heightAnchor.constraint(equalToConstant: size.height).isActive = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
