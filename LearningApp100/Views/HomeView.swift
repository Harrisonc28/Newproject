//
//  ContentView.swift
//  LearningApp100
//
//  Created by Harrison Carroll on 23/10/2022.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model: ContentModel
    
    
    var body: some View {
        
        NavigationView {
            VStack(alignment: .leading) {
                Text("What do you want to do today?").padding(.leading, 20)
        
        ScrollView {
            
            LazyVStack {
                
                ForEach(model.modules) { module in
                    
                    VStack (spacing: 20){
                        
                        
                        
                        
                        
                        NavigationLink(destination: ContentView().onAppear(perform: {
                            model.beginModule(moduleid: module.id)
                           
                        }),
                                       tag: module.id,
                                       selection: $model.currentContentSelected,
                                       
                                       label: {
                            
                            HomeViewRow(image: module.content.image, title: "Learn \(module.category)", description: module.content.description, count: "\(module.content.lessons.count) Lessons", time: module.content.time)
                            
                        })
                        
                        NavigationLink(destination: TestView().onAppear(perform: {
                            model.beginTest(moduleId: module.id)
                        }), tag: module.id, selection: $model.currentTestSelected) {
                            HomeViewRow(image: module.test.image, title: " \(module.category) Test", description: module.test.description, count: "\(module.test.questions.count) Lessons", time: module.test.time)
                        }
                    
                        NavigationLink(destination: EmptyView() ) {
                            EmptyView()
                        }
                    
                    }
                    
                }
                .accentColor(.black)
            }.padding()
            
            
            
            
        }
        }
        .navigationTitle("Get Started")
        }
        .navigationViewStyle(.stack)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(ContentModel()).previewInterfaceOrientation(.landscapeLeft)
    }
}
