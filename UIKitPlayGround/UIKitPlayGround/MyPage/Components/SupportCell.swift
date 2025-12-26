//
//  SupportCell.swift
//  UIKitPlayGround
//
//  Created by 김동준 on 12/23/25
//

import UIKit

final class SupportCell: UITableViewCell {
    static let identifier = "SupportCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .medium)
        
        return label
    }()
        
    private let arrowImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .icArrowRight.resized(to: CGSize(width: 20, height: 20))

        return imageView
    }()
    
    private let additionalValueLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.textAlignment = .right
        label.isHidden = true
        return label
    }()
    
    private let dividerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.gray.withAlphaComponent(0.2)
        
        return view
    }()
}

private extension SupportCell {
    func setupUI() {
        let view = UIView()
        view.backgroundColor = UIColor.systemGray4.withAlphaComponent(0.5)
        selectedBackgroundView = view
    }
    
    func setupLayout() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(arrowImage)
        contentView.addSubview(additionalValueLabel)
        contentView.addSubview(dividerView)
        
        titleLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(14)
            $0.leading.equalToSuperview()
        }
        
        arrowImage.snp.makeConstraints {
            $0.centerY.equalTo(titleLabel)
            $0.trailing.equalToSuperview()
            $0.leading.greaterThanOrEqualTo(titleLabel.snp.trailing)
        }
        
        additionalValueLabel.snp.makeConstraints {
            $0.centerY.equalTo(titleLabel)
            $0.trailing.equalToSuperview()
            $0.leading.greaterThanOrEqualTo(titleLabel.snp.trailing).offset(8)
        }
        
        dividerView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.height.equalTo(1)
        }
    }
}

extension SupportCell {
    func configure(_ model: SupportCellModel) {
        dividerView.isHidden = model.hideDivider
        titleLabel.text = model.type.name
        
        switch model.type {
        case .versionInfo:
            arrowImage.isHidden = true
            additionalValueLabel.isHidden = false
            additionalValueLabel.text = model.appVersion
            isUserInteractionEnabled = false
        default:
            arrowImage.isHidden = false
            additionalValueLabel.isHidden = true
            additionalValueLabel.text = nil
        }
    }
}
