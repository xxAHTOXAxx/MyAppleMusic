import UIKit
import SnapKit

final class SearchCell: UICollectionViewCell {
    static let identifier = String(describing: SearchCell.self)

    // MARK: - Outlets
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        return imageView
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .bold)
        label.textColor = .white
        label.numberOfLines = 2
        return label
    }()

    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup
    
    private func setupView() {
        layer.cornerRadius = 8
    }

    private func setupHierarchy() {
        addSubview(imageView)
        addSubview(titleLabel)
    }

    private func setupLayout() {
        imageView.snp.makeConstraints { $0.bottom.top.leading.trailing.equalTo(self) }

        titleLabel.snp.makeConstraints { $0.bottom.leading.trailing.equalTo(imageView).inset(15) }
    }

    // MARK: - Update Method
    
    func update(title: String, imageName: String) {
        titleLabel.text = title
        imageView.image = UIImage(named: imageName)
    }
}
