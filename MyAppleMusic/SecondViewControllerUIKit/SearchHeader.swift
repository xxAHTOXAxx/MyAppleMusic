import UIKit
import SnapKit

final class SearchHeader: UICollectionReusableView {
    static let identifier = String(describing: SearchHeader.self)

    // MARK: - Outlets
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 21, weight: .bold)
        return label
    }()
    
    private let separator: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray6
        return view
    }()
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("Error in Cell")
    }

    // MARK: - Update Method
    func update(title: String) {
        titleLabel.text = title
    }

    // MARK: - Setup
    private func setupHierarchy() {
        addSubview(separator)
        addSubview(titleLabel)
    }

    private func setupLayout() {
        separator.snp.makeConstraints { make in
            make.height.equalTo(0.5)
            make.leading.trailing.equalTo(self).inset(16)
            make.top.equalTo(self)
        }

        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(self).inset(16)
            make.centerY.equalTo(self)
        }
    }
}
