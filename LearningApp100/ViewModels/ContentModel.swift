//
//  ContentModel.swift
//  LearningApp100
//
//  Created by Harrison Carroll on 23/10/2022.
//

import Foundation
import AVFoundation

class ContentModel: ObservableObject {
    
    @Published var modules = [Module]()
    
    
    //Current module
    
    @Published var currentModule: Module?
    
    var currentModelIndex = 0
    
    
    
    //Current Lesson Explanation
    
    @Published var lessonDescription = NSAttributedString()
    
    
    
    
    //Current Lesson
    
    
    @Published var currentLesson: Lesson?
    
    var currentLessonIndex = 0
    
    var styleData: Data?
    
    //Current selected content and test
    
    @Published var currentContentSelected: Int?
    
    
    
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
    
    func beginLesson (lessonIndex: Int) {
        
        //Check that the current lesson is within range of module lessons
        if lessonIndex < currentModule!.content.lessons.count {
            
            currentLessonIndex = lessonIndex
            
            
        }
        else {
            
            currentLessonIndex = 0
            
            
        }
        
        //Set the current lessons
        currentLesson = currentModule!.content.lessons[currentLessonIndex]
        lessonDescription = addStyling(htmlString: currentLesson!.explanation)
        
        
        
        
        
        
    }
    
    func nextLesson() {
        
        //Advance the lesson index
        currentLessonIndex += 1
        //Check that it is within range
        if currentLessonIndex < currentModule!.content.lessons.count {
            
            //Set the current lesson property
            currentLesson = currentModule!.content.lessons[currentLessonIndex]
            
            lessonDescription = addStyling(htmlString: currentLesson!.explanation)
            
        }
        else {
            
            //Reset the lesson state
            currentLessonIndex = 0
            currentLesson = nil
            
        }
        
       
    }
    
    
    func hasNextLesson() -> Bool {
        
        
        return (currentLessonIndex + 1 < currentModule!.content.lessons.count)
    }
    
    //MARK: - Code Styling
    
    private func addStyling ( htmlString: String) -> NSAttributedString {
        
        
        var resultString = NSAttributedString()
        
        
        return resultString
        
        var data = Data()
        
        
        if styleData != nil {
        data.append(self.styleData!)
            
            
        }
        data.append(Data(htmlString.utf8))
    
        if let attributedString = try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil) {
            
            resultString = attributedString
        
            
        }
        
        
        
        
        
       }
        
        
    }
    
    
    
    
    
    
    
    
    

