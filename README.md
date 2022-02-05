# Thirdwayv

In the collectionView challenge, a MVVM architecture was used to allow the code to follow the solid principles by allowing to distribute responsibilities
between different classes.
The ViewModel Projects the data retrieved from the mode, either through the network or the local caching layer.
All classes were following the principle of open closed to accept any upcoming modifications.
Each class or struct was only responsible of one and only one action to achieve the signle responsibility Priciple as in the api call where there are two classes, 
first is responsible of api calling over the network and the other to calll the data from the caching layer.
The caching layer was splited in two parts, first one to cache the api response and save it using the file manager and the other to cache the images and reduce the
usage of the network calls by saving images using "URLCache"
Many design patterns were used like facade design pattern for the api controlling and persistent caching layer.
Decorator design pattern was used in view controllers like the products view controller to split the class in multiple extensions depending on
the comforting protocols.
Delegation design pattern was used in passing data and configuration of the animation
