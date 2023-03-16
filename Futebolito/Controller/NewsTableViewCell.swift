//
//  NewsTableViewCell.swift
//  Futebolito
//
//  Created by Gustavo Fernandes on 16/03/23.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    static let identifier = "NewsTableViewCell"
    
    private lazy var backgroundViews: UIView = {
        let backgroundView = UIView()
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.backgroundColor = UIColor(named: "greyColor")
//        backgroundView.addSombra()
        return backgroundView
    }()
    
    private lazy var newsImage: UIImageView = {
        let newsImage = UIImageView()
        newsImage.translatesAutoresizingMaskIntoConstraints = false
        newsImage.contentMode = .scaleAspectFill
        newsImage.image = UIImage(named: "newsImage")
    
        return newsImage
    }()
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "PALMEIRAS CAMPEÃO MUNDIAL 2023 "
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [newsImage,label])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 0
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.backgroundColor = .white
        stackView.layer.cornerRadius = 10
        stackView.layer.masksToBounds = true

        
        return stackView
        
    }()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
extension NewsTableViewCell: ViewConfiguration {
    func buildViewHierarchy() {
        contentView.addSubview(backgroundViews)
        contentView.addSubview(stackView)
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            stackView.heightAnchor.constraint(equalToConstant: 230),
            
            backgroundViews.topAnchor.constraint(equalTo: contentView.topAnchor),
            backgroundViews.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            backgroundViews.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            backgroundViews.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            backgroundViews.heightAnchor.constraint(equalToConstant: 260),
        
        ])
    }
    
    func setupAdditionalConfiguration() {
        self.backgroundColor = UIColor(named: "greyColor")
    }
}
