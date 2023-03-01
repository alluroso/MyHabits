//
//  ProgressCollectionViewCell.swift
//  MyHabits
//
//  Created by Алексей Калинин on 27.02.2023.
//

import UIKit

class ProgressCollectionViewCell: UICollectionViewCell {

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Всё получится!"
        label.font = .footnoteStatus
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var percentLabel: UILabel = {
        let label = UILabel()
        label.font = .footnoteStatus
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var progressView: UIProgressView = {
        let progressView = UIProgressView()
        progressView.trackTintColor = .systemGray2
        progressView.progressTintColor = .purpleCustom
        progressView.translatesAutoresizingMaskIntoConstraints = false
        return progressView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.layer.cornerRadius = 10
        contentView.backgroundColor = .white
        refreshProgress()
        setupViews()
        constraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func refreshProgress() -> Void {
        progressView.setProgress(HabitsStore.shared.todayProgress, animated: true)
        percentLabel.text = "\(Int(HabitsStore.shared.todayProgress * 100))%"
    }

    private func setupViews() {
        contentView.addSubviews(titleLabel, percentLabel, progressView)
    }

    private func constraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),

            percentLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            percentLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),

            progressView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            progressView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            progressView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            progressView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15)
        ])
    }
}
