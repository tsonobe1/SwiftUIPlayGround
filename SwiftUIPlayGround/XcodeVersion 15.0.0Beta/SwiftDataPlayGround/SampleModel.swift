//
//  SampleModel.swift
//  SwiftUIPlayGround
//
//  Created by tsonobe on 2023/09/05.
//

import SwiftUI
import SwiftData


@Model
final class NoteBook {
    @Attribute(.unique) var id: UUID
    var title: String
    var page: Int
    
    init(id: UUID, title: String, page: Int) {
        self.id = UUID()
        self.title = title
        self.page = page
    }
}



