//
//  ProfileCell.swift
//  Swift-Card's-API-Marvel
//
//  Created by Luccas Santana Marinho on 01/04/22.
//

import UIKit

protocol ReusableView: AnyObject {
    static var identifier: String { get }
}

final class ProfileCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .orange
        clipsToBounds = true
        layer.cornerRadius = 10
        
        self.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.widthAnchor.constraint(equalTo: widthAnchor),
            label.heightAnchor.constraint(equalToConstant: 50),
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private(set) lazy var label: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
}

extension ProfileCell: ReusableView {
    static var identifier: String {
        return String(describing: self)
    }
}
