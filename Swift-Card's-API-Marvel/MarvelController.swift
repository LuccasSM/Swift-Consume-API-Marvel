//
//  ViewController.swift
//  Swift-Card's-API-Marvel
//
//  Created by Luccas Santana Marinho on 01/04/22.
//

import UIKit

class MarvelController: UIViewController {
    
    var api: [MovieData] = []
    
    private lazy var button: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemCyan
        button.setTitle("Procurar heróis", for: .normal)
        button.addTarget(self, action: #selector(startApi), for: .touchUpInside)
        return button
    }()

    private let collectionView: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        collectionView.backgroundColor = .systemPurple
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupLayouts()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        AppDelegate.AppUtility.lockOrientation(UIInterfaceOrientationMask.portrait, andRotateTo: UIInterfaceOrientation.portrait)
    }

    private func setupViews() {
        view.backgroundColor = .systemPurple
        view.addSubview(collectionView)
        self.view.addSubview(button)

        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ProfileCell.self, forCellWithReuseIdentifier: ProfileCell.identifier)
    }

    private func setupLayouts() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalToConstant: 150),
            button.widthAnchor.constraint(equalToConstant: 150),
            button.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            
            collectionView.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 10),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }

    init() {
        super.init(nibName: nil, bundle: nil)
        MarvelApiENdereco.servicoApi { api in
            DispatchQueue.main.async {
                self.api = Array(api.data.shuffled().prefix(8))
                self.collectionView.reloadData()
            }
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func startApi() {
        MarvelApiENdereco.servicoApi { api in
            DispatchQueue.main.async {
                self.api = Array(api.data.shuffled().prefix(8))
                self.collectionView.reloadData()
            }
        }
    }
}

extension MarvelController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return api.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileCell.identifier, for: indexPath) as! ProfileCell
        cell.label.text = api[indexPath.row].title
        cell.label.textAlignment = .center
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16, left: 16, bottom: 161, right: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        present(OverviewMarvel(titleMarvel: api[indexPath.row].directed_by), animated: true, completion: nil)
    }
}

extension MarvelController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width - (3 * 16)) / 2
        return CGSize(width: width, height: width + 46)
    }
}
