//
//  UsingState.swift
//  TestingMVVM
//
//  Created by Conner Yoon on 8/29/24.
//

import SwiftUI

struct UsingState: View {
    @State var counter = 0
    var body: some View {
        
        VStack {
            Text("Counter : \(counter)")
            Button("Test \(counter)"){
                counter+=1
            }
        }
    }
}

#Preview {
    UsingState()
}
