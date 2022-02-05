//
//  ViewController.swift
//  Thirdwayv
//
//  Created by Khalid hassan on 1/30/22.
//

import UIKit

class ProductsViewController: UIViewController {
    
    
    var productsViewModel: ProductsViewModel?
    
    var viewedProductsList: [Product]?
    
    var transition = PushAnimator()
    
    
    
    let ProductsCollectionView: UICollectionView = {
        
        let layout = ProductsLayout()
        
        
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView .register(ProductsCollectionViewCell.self, forCellWithReuseIdentifier: Strings.productCellIdentifier)
        
        return collectionView
        
        
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if let layout = ProductsCollectionView.collectionViewLayout as? ProductsLayout {
          layout.delegate = self
        }
        view.backgroundColor = .white
        self.title = Strings.mainViewTitle
        ProductsCollectionView.delegate = self
        ProductsCollectionView.dataSource = self
        ProductsCollectionView.prefetchDataSource = self
        setProductsCollectionViewContraints()
        
        productsViewModel = ProductsViewModel()
        setBinders()
       
    
        
        
    
        
        
    }
    
    
    func setBinders(){
        productsViewModel?.bindProductsViewModelToView = {
            self.onSuccessUpdateCollectionView()
        }
        
        productsViewModel?.bindViewModelErrorToView = {
            self.onFailUpdateView()
        }
        
        productsViewModel?.bindSelectedProductToView = {
            self.onSelectSuccessMovetoDetails()
        }
    }
    
    func onSelectSuccessMovetoDetails(){
        let productDetailsVC = ProductDetailsVC()
        if let selectedProduct = productsViewModel?.selectedProduct{
       
           productDetailsVC.selectedProduct = selectedProduct
            productDetailsVC.transitioningDelegate = self
           
           //self.navigationController?.pushViewController(productDetailsVC, animated: true)
            self.present(productDetailsVC, animated: true, completion: nil)
       }
    }
    
    func onSuccessUpdateCollectionView(){
        viewedProductsList = productsViewModel?.productsList
        DispatchQueue.main.async { [weak self] in
            self?.ProductsCollectionView.reloadData()

        }
        
    }
    
    
    func onFailUpdateView(){
        let alert = UIAlertController(title: "Error", message: productsViewModel?.showError, preferredStyle: .alert)
        
        let okAction  = UIAlertAction(title: "Ok", style: .default) { (UIAlertAction) in
            
            
        }
        
        
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    
    
    
    
    func setProductsCollectionViewContraints(){
      
        view.addSubview(ProductsCollectionView)
        ProductsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        ProductsCollectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        if #available(iOS 11.0, *) {
            ProductsCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
            } else {
                ProductsCollectionView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true
            }
        
        ProductsCollectionView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        ProductsCollectionView.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor).isActive = true
        
       
    }

}


extension ProductsViewController: ProductsLayoutDelegate {
  func collectionView(
      _ collectionView: UICollectionView,
      heightForPhotoAtIndexPath indexPath:IndexPath) -> CGFloat {
    
    if let product = viewedProductsList?[indexPath.row]{
        
        let approximateWidth = (collectionView.bounds.width / 2) - 16
        
        let size = CGSize(width: approximateWidth, height: 10000)
        
        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)]
        
        let estimatedDescriptionFrame = NSString(string: product.productDescription ?? "").boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
        
        let height = CGFloat((product.image?.height)! + 30)
        
        let estimatedHeight = estimatedDescriptionFrame.height + height
    
    return estimatedHeight
  }
    return 200
  }
}

