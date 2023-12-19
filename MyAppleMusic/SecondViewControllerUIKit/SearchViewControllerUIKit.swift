import Foundation
import SwiftUI
import UIKit
import SnapKit

struct SecondSearchViewUIKit: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> some UIViewController {
        let searchViewController = UINavigationController(rootViewController: SearchViewControllerUIKit())
        return searchViewController
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) { }
}

final class SearchViewControllerUIKit: UIViewController {
    private var items = ModelItemsForSearch.itemsArray
    
    // MARK: - Outlets
    
    private lazy var colectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(
            SearchCell.self,
            forCellWithReuseIdentifier: SearchCell.identifier
        )
        collection.register(
            SearchHeader.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: SearchHeader.identifier
        )
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.dataSource = self
        collection.delegate = self
        return collection
    }()
    
    private lazy var searchController: UISearchController = {
        let search = UISearchController()
        search.searchBar.placeholder = "Поиск..."
        return search
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarchy()
        setupLayout()
    }
    
    // MARK: - Setups
    private func setupView() {
        view.backgroundColor = .white
        title = "Поиск"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.searchController = searchController
    }
    
    private func setupHierarchy() {
        view.addSubview(colectionView)
    }
    
    private func setupLayout() {
        colectionView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view)
            $0.bottom.equalTo(view).inset(66)
        }
    }
}

// MARK: - UICollectionViewDataSource
extension SearchViewControllerUIKit: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: SearchCell.identifier,
            for: indexPath
        ) as? SearchCell else { return UICollectionViewCell() }
        cell.update(title: items[indexPath.row].genreOfMusic,
                    imageName: items[indexPath.row].itemImage)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: SearchHeader.identifier,
            for: indexPath
        ) as? SearchHeader else { return UICollectionReusableView() }
        header.update(title: "Поиск по категориям")
        return header
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension SearchViewControllerUIKit: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(
            width: (view.frame.width / 2) - 22,
            height: (view.frame.height / 5) - 22
        )
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForHeaderInSection section: Int) -> CGSize {
        CGSize(width: view.frame.width, height: 40)
    }
}
