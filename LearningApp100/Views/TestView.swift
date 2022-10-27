//
//  TestView.swift
//  LearningApp100
//
//  Created by Harrison Carroll on 26/10/2022.
//

import SwiftUI

struct TestView: View {
    
    @EnvironmentObject var model: ContentModel
    var body: some View {
        if model.currentQuestion != nil {
            
            VStack {
                
                //Question Number
                
                Text("Question \(model.currentQuestionIndex + 1) of \(model.currentModule!.test.questions.count ?? 0)")
                //Question
                CodeTextView()
                
                //Answers
                
                //Button
                
            }
            .navigationBarTitle("\(model.currentModule?.category ?? "") Test")
            
            
            
        }
        else {
            
            
            //Text hasn't loaded yet
            
            ProgressView()
            
            
            
            
            
            
            
            
            
            
            
            
            
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
