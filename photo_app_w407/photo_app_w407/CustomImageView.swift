//
//  CustomImageView.swift
//  photo_app_w407
//
//  Created by Gautam Sharma on 20/06/23.
//

import UIKit
import SDWebImage

extension UIImageView {
    
    //load image using SDWebImage Package -
    
    func loadImageSd(url : URL){
        self.image = nil;
        self.sd_imageTransition = .fade(duration: 0.25);
        
        // Show circular loader
        showCircularLoader()
        
        //store image in cache directory if image is present on cache then it will fetch from the cache directory
        //otherwise set image from the url
        
        guard let cacheImage = SDImageCache.shared.imageFromCache(forKey: url.absoluteString) else {
            sd_setImage(with: url ,  completed: {  image, error , cacheType,imageURL in
                self.hideCircularLoader()
                guard let image = image else {
                    print("Could not load image");
                    return
                }
                SDImageCache.shared.store(image, forKey: url.absoluteString)
                self.image = image
            })
            return
        }
        hideCircularLoader()
        self.image = cacheImage
    }
    
    private func showCircularLoader() {
        let activityIndicator = UIActivityIndicatorView(style: .medium)
        activityIndicator.center = CGPoint(x: self.bounds.width / 2, y: self.bounds.height / 2)
        activityIndicator.startAnimating()
        self.addSubview(activityIndicator)
    }
    
    private func hideCircularLoader() {
        for subview in self.subviews {
            if let activityIndicator = subview as? UIActivityIndicatorView {
                activityIndicator.stopAnimating()
                activityIndicator.removeFromSuperview()
                break
            }
        }
    }
    
    func loadImage(url:URL){
        let task = URLSession.shared.dataTask(with: url){
            data,response,error in
            
            
            guard let data = data , let newImage = UIImage(data: data) else {
                print("Could not load image");
                return
            }
            
            DispatchQueue.main.async {
                self.image = newImage;
            }
            
        }
        task.resume()
    }
}
