//
//  ProductsCollectionViewCell.swift
//  Thirdwayv
//
//  Created by Khalid hassan on 1/31/22.
//

import UIKit

class ProductsCollectionViewCell: UICollectionViewCell {
    
     let productImageView: customImage = {
        let image = customImage()
        
        return image
        
    }()
    
     let priceLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    
     let descriptionLabel: UITextView = {
        let textView = UITextView()
        textView.isScrollEnabled = false
        textView.isEditable = false
        return textView
    }()
    
    
    override class func awakeFromNib() {
        
    }
    
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .white
        setProductImageViewOnCell()
        setPriceLabelOnCell()
        setDescriptionLabelOnCell()
        
        self.layer.borderColor = UIColor.gray.cgColor
        self.layer.borderWidth = 1
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func setProductImageViewOnCell(){
        contentView.addSubview(productImageView)
        productImageView.translatesAutoresizingMaskIntoConstraints = false
        productImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        productImageView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor,constant: 8).isActive = true
        productImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: -16).isActive = true
        productImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.6).isActive = true
    }
    
    func setPriceLabelOnCell(){
        contentView.addSubview(priceLabel)
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        priceLabel.topAnchor.constraint(equalTo: productImageView.bottomAnchor,constant: 8).isActive = true
        priceLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: -16).isActive = true
        priceLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.1).isActive = true
    }
    
    func setDescriptionLabelOnCell(){
        contentView.addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor,constant: 8).isActive = true
        descriptionLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: -16).isActive = true
        //descriptionLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.2).isActive = true
    }
    
}
