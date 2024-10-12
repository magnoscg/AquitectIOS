//
//  ListContentView.swift
//  Arquitectura
//
//  Created by Oscar Canton on 30/9/24.
//

import Foundation
import SwiftUI

struct ItemContent: View {
    let item: ListItem
    let onTap: () -> Void

    var body: some View {
        HStack {
            Text(item.title)
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .contentShape(Rectangle())
        .onTapGesture(perform: onTap)
    }
}

#Preview {
    ItemContent(item: ListItem(id: .init(), title: "Title", icon: "icon", url: "url"), onTap: {})
}
