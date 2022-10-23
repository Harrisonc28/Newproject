//
//  ContentModel.swift
//  LearningApp100
//
//  Created by Harrison Carroll on 23/10/2022.
//

import Foundation

class ContentModel: ObservableObject {
    
    @Published var modules = [Module]()
    
    
    //Current module
    
    @Published var currentModule: Module?
    
    var currentModelIndex = 0
    
    
    var styleData: Data?
    
    
    init() {
        
        getLocalData()
        
        
        
        
        
    }
    //MARK: -Data methods
    func getLocalData() {
        
        let jsonUrl = Bundle.main.url(forResource: "data", withExtension: "json")
        
        do {
            
            let jsonData = try Data(contentsOf: jsonUrl!)
            
            let jsonDecoder = JSONDecoder()
            
            let modules = try jsonDecoder.decode([Module].self, from: jsonData)
            
            self.modules = modules
            
            
        }
        catch {
            
            print("Couldnt parse local data")
            
            
        }
        
        
        let styleUrl = Bundle.main.url(forResource: "style", withExtension: "html")
        
        do{
            let styleData = try Data(contentsOf: styleUrl!)
            
            
            self.styleData = styleData
        }
        catch {
            
            
            print("Couldnt parse local data")
         
        }
        
    }

    
    //MARK: -Module navigation methods
    
    func beginModule ( moduleid:Int) {
        
        
        
        //Find the index for this module id
        for index in 0..<modules.count {
            
            if modules[index].id == moduleid {
                
                //Found the matching module
                currentModelIndex = index
                break
                
                
            }
            
            
        }
        //Set the current module
        currentModule = modules[currentModelIndex]
        
        
        
        
    }
    
}
