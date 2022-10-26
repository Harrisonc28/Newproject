//
//  ContentDetailView.swift
//  LearningApp100
//
//  Created by Harrison Carroll on 23/10/2022.
//

import SwiftUI
import AVKit



struct ContentDetailView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        let lesson = model.currentLesson
        
        let url = URL(string: Constants.videoHostUrl + (lesson?.video ?? ""))
        
        
        VStack {
        
        if url != nil {
        VideoPlayer(player: AVPlayer(url: url!))
        .cornerRadius(10)
        }
        
        //Todo: Add the description
        
           CodeTextView()
            
            
            
            
            
        //Next lesson button
            
            if model.hasNextLesson() {
                Button (action: { model.nextLesson()
                    
                }, label: {
                    
                    ZStack {
                    
                        RectangleCard(color: Color.green).frame(height: 48)
                    
                    
                        Text("Next Lesson: \(model.currentModule!.content.lessons[model.currentLessonIndex + 1].title)").foregroundColor(Color.white).bold()
                    
                        
                    }
                        
                })
            
                
               
            }
            else {
                
                //Show the complete button instead
                
                Button (action: {
                    
                    //Take the user back to the HomeView
                    
                    model.currentContentSelected = nil
                    
                }, label: {
                    
                    ZStack {
                    
                        RectangleCard(color: Color.green).frame(height: 48)
                    
                    
                        Text("Completed").foregroundColor(Color.white).bold()
                    
                        
                    }
                        
                })
                
                
            }

            
            
        }
        .padding()
        .navigationBarTitle(lesson?.title ?? "")
    }
}

struct ContentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentDetailView()
    }
}
