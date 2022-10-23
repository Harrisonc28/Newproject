//
//  LearningApp100.swift
//  LearningApp100
//
//  Created by Harrison Carroll on 23/10/2022.
//

import SwiftUI

@main
struct LearningApp100: App {
    var body: some Scene {
        WindowGroup {
            HomeView().environmentObject(ContentModel())
        }
    }
}
