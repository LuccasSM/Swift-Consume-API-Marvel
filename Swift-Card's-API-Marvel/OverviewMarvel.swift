//
//  OverviewMarvel.swift
//  Swift-Card's-API-Marvel
//
//  Created by Luccas Santana Marinho on 04/04/22.
//

import Foundation
import UIKit

class OverviewMarvel: UIViewController {
    var titleMarvel: String
    
    private lazy var label: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = titleMarvel
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    func insertView() {
        self.view.addSubview(label)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemCyan
        insertView()
        
        NSLayoutConstraint.activate([
            label.widthAnchor.constraint(equalTo: view.widthAnchor),
            label.heightAnchor.constraint(equalToConstant: 100),
            label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
        ])
    }
    
    init(titleMarvel: String) {
        self.titleMarvel = titleMarvel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
