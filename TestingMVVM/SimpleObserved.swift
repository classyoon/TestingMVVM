//
//  SimpleObserved.swift
//  TestingMVVM
//
//  Created by Conner Yoon on 8/30/24.
//

import SwiftUI

struct SimpleObserved: View {
    @ObservedObject var model : Observed
    var body: some View {
        VStack{
            Text("\(model.num)")
            Button("Change"){
                model.num+=1
                print("\(model.num)")
            }
        }
    }
}
class Observed : ObservableObject {
    @Published var num : Int
    init(num: Int) {
        self.num = num
    }
}

#Preview {
    SimpleObserved(model: Observed(num: 0))
}
