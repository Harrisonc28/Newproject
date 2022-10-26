//
//  ContentView.swift
//  LearningApp100
//
//  Created by Harrison Carroll on 23/10/2022.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        ScrollView {
            
            LazyVStack {
        
                //Confirm that current module is set
                
                if model.currentModule != nil {
                    
                
                    ForEach(0..<model.currentModule!.content
                        .lessons.count) { index in
                        
                            
                            NavigationLink( destination: ContentDetailView().onAppear(perform: { model.beginLesson(lessonIndex: index) }), label: {  ContentViewRow(index: index)})
                            
                          ContentViewRow(index: index)
                        
                    }
                        
                        
                    }
                
                
                
            }
            .accentColor(.black)
            .padding()
            .navigationTitle("Learn \(model.currentModule?.category ?? "")")
            
            
            
        }
    }
}

