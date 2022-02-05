//
//  ProductsViewModel.swift
//  Thirdwayv
//
//  Created by Khalid hassan on 1/30/22.
//

import Foundation

class ProductsViewModel {
    
    private var isStartingApp = true
    private var isDataFromCaching = false
    
    var productsService: ProductsService?
    
    var productsList: [Product]? {
        didSet{
            if !isDataFromCaching{
            self.startCaching()
            }
            self.bindProductsViewModelToView()
        }
    }
    
    var selectedProduct: Product?{
        didSet{
            bindSelectedProductToView()
        }
    }
    
    
    private var connectivity: Connectivity?
    
    private var connectionState: Bool? {
        didSet{
            self.handleNetworkChange()
        }
    }
    
    
    var fileManager: ProductFileManager?
    
    
     
    
    
    var bindProductsViewModelToView : (()->()) = {}
    var bindViewModelErrorToView : (()->()) = {}
    var bindSelectedProductToView: (()->()) = {}
    
    
    var showError : String! {
        
        didSet{
            
            self.bindViewModelErrorToView()
        }
        
    }
    
   // ####################################
    init() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(newtworkStateChanged(_:)), name: NSNotification.Name(rawValue: Strings.networkNotificationCenterName), object: nil)
        fileManager = ProductFileManager()
        productsService = ProductsService()
        connectivity = Connectivity()
        connectivity?.start()
        
        
    }
    
    @objc func newtworkStateChanged(_ notification: NSNotification){
        if let connectionState = notification.userInfo?[Strings.networkNOtificationCenterDataName] as? Bool{
            self.connectionState = connectionState
        }
        
    }
    
    
    
    
    func selectProductToShowDetails(productIndex: Int){
        selectedProduct = productsList?[productIndex]
    }
    
    //####################################
    
    func getProductsFromService(isPageOne: Bool){
        
        DispatchQueue.global().async {
            
            self.productsService?.getProductsFromApi(completion: { [weak self] dataResult, error in
            
            if let error : Error = error{
                
                let message = error.localizedDescription
                self?.showError = message
                
            }else{
                if let rawJsonData = dataResult{
                    do{
                        
                        let decodedList =  try JSONDecoder().decode([Product].self, from:rawJsonData)
                        
                        if isPageOne{
                        self?.productsList = decodedList
                        }else{
                            var tempList = self?.productsList
                            for element in decodedList{
                                tempList?.append(element)
                            }
                            
                            self?.productsList = tempList
                        }
                        
                    }catch let err as NSError{
                        print("Catch Error: \(err)")
                    }
                }
            }
            
        })
        
       }
    }
    
    private func handleNetworkChange(){
        
        if connectionState! {
            isDataFromCaching = false
            getProductsFromService(isPageOne: true)
            isStartingApp = false
            
            
        }else{
            isDataFromCaching = true
            if isStartingApp == true{
                
                getCachedData()
            }
        }
         
         
     }
    
    
    func getDataStatus() -> Bool{
        return isDataFromCaching
    }
    
    func startCaching(){
        
        
        fileManager?.cacheProducts(with: productsList ?? [])
    }
    
    func getCachedData(){
        
        productsList = fileManager?.readCachedProducts()
        
    }
}
