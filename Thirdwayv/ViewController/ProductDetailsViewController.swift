//
//  ProductDetailsViewController.swift
//  Thirdwayv
//
//  Created by Khalid hassan on 2/1/22.
//

import Foundation
import UIKit


class ProductDetailsVC: UIViewController {
    
    
    

    var productImageView: customImage = {
        let imageView = customImage()
        
        return imageView
        
    }()
    
    var productPriceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemRed
        label.font = label.font.withSize(25)
        label.textAlignment = .center
        
        return label
    }()
    
    
    var productDescriptionTextView: UITextView = {
       let textView = UITextView()
        textView.isScrollEnabled = false
        textView.backgroundColor = .clear
        textView.isEditable = false

        
        return textView
    }()
    
    var selectedProduct = Product()
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        setProductImageContraints()
        setProductPriceLabelContraints()
        setProductDescriptionTextViewContraints()
        
        let priceString = String(selectedProduct.price ?? 0)
        
        self.title = Strings.productDetailsTitle
        self.productPriceLabel.text = "price: \(priceString) $"
        self.productDescriptionTextView.text = selectedProduct.productDescription
        if let imageURL = URL(string: selectedProduct.image?.url ?? ""){
        self.productImageView.getImage(imageURL: imageURL)
        
        }
    }
    
    
    func setProductImageContraints(){
        view.addSubview(productImageView)
        productImageView.translatesAutoresizingMaskIntoConstraints = false
        productImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        if #available(iOS 11.0, *) {
            productImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
            } else {
                productImageView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 8).isActive = true
            }
        productImageView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -16).isActive = true
        productImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6).isActive = true
        
    }
    
    func setProductPriceLabelContraints(){
        view.addSubview(productPriceLabel)
        productPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        productPriceLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        productPriceLabel.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: 8).isActive = true
        productPriceLabel.widthAnchor.constraint(equalTo: productPriceLabel.widthAnchor).isActive = true
        productPriceLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1).isActive = true
        
    }
    
    func setProductDescriptionTextViewContraints(){
        view.addSubview(productDescriptionTextView)
        productDescriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        productDescriptionTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        productDescriptionTextView.topAnchor.constraint(equalTo: productPriceLabel.bottomAnchor, constant: 8).isActive = true
        productDescriptionTextView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
//        productDescriptionTextView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2).isActive = true
        
    }
}
