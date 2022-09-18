//
//  LibraryAppApp.swift
//  LibraryApp
//
//  Created by Tobiloba on 15/09/2022.
//

import SwiftUI

@main
struct LibraryApp: App {
    var body: some Scene {
        WindowGroup {
            BookList().environmentObject(ViewModel())
        }
    }
}
