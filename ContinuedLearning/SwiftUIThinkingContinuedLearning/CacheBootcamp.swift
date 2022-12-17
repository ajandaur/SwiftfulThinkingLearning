//
//  CacheBootcamp.swift
//  SwiftUIThinkingContinuedLearning
//
//  Created by Anmol  Jandaur on 5/23/22.
//

import SwiftUI

class CacheManager {
    
    static let instance = CacheManager() // Singleton
    private init() { }
    
    // Key-value pair
    var imageCache: NSCache<NSString, UIImage> = {
        let cache = NSCache<NSString, UIImage>()
        cache.countLimit = 100
        cache.totalCostLimit = 1024 * 1024 * 100 // 100 mb
        return cache
    }()
    
    // func to add item to cache
    func add(image: UIImage, name: String) -> String {
        imageCache.setObject(image, forKey: name as NSString)
        return "Added to cache!"
    }
    
    func remove(name: String) -> String  {
        imageCache.removeObject(forKey: name as NSString)
        return "Removed from cache!"
    }
    
    func get(name: String) -> UIImage? {
        return imageCache.object(forKey: name as NSString)
    }
}



class CacheViewModel: ObservableObject {
    
    @Published var startingImage: UIImage? = nil
    @Published var cachedImage: UIImage? = nil
    @Published var infoMessage: String = ""
    let imageName: String = "steve_jobs"
    let manager = CacheManager.instance
    
    init() {
        
    }
    
    func getImageFromAssetsFolder() {
        startingImage = UIImage(named: imageName)
    }
    
    func saveToCache() {
        guard let image = startingImage else { return }
        infoMessage = manager.add(image: image, name: imageName)
    }
    
    func removeFromCache() {
        if let returnedImage = manager.get(name: imageName) {
            infoMessage = manager.remove(name: imageName)
        }
       
    }
    
    func getFromCache() {
        if let returnedImage = manager.get(name: imageName) {
            cachedImage = returnedImage
            infoMessage = "Got image from Cache"
        } else {
            infoMessage = "Image not found in cache"
        }
    
    }
}

struct CacheBootcamp: View {
    
    @StateObject var vm = CacheViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
       
                if let image = vm.startingImage {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200)
                        .clipped()
                        .cornerRadius(10)
                    
                }
                
                Text(vm.infoMessage)
                    .font(.headline)
                    .foregroundColor(.purple)
                
                HStack {
                    Button {
                        vm.saveToCache()
                    } label: {
                        Text("Save to Cache")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    
                    Button {
                        vm.removeFromCache()
                    } label: {
                        Text("Delete from Cache")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.red)
                            .cornerRadius(10)
                    }
                    
                    Button {
                        vm.getFromCache()
                    } label: {
                        Text("Get from Cache")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.green)
                            .cornerRadius(10)
                    }
                    
                    if let image = vm.cachedImage {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 200, height: 200)
                            .clipped()
                            .cornerRadius(10)
                        
                    }
                }

              

            }
        }
    }
}

struct CacheBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        CacheBootcamp()
    }
}
