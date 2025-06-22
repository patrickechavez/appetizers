//
//  XDismissButton.swift
//  Appetizers
//
//  Created by John Patrick Echavez on 6/22/24.
//

import SwiftUI

struct XDismissButton: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 30, height: 30)
                .foregroundStyle(Color(.gray))
                .opacity(0.6)
                
            Image(systemName: "xmark")
                .imageScale(.small)
                .frame(width: 44, height: 44)
                .foregroundStyle(Color.black)
        }
    }
}

#Preview {
    XDismissButton()
}
