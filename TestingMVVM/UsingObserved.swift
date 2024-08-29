//
//  UsingObserved.swift
//  TestingMVVM
//
//  Created by Conner Yoon on 8/29/24.
//

import SwiftUI


struct UsingObserved: View {
    @ObservedObject var tracker : Tracker
    var body: some View {
        
        VStack {
            Text("Counter : \(tracker.counter)")
            Button("Test \(tracker.counter)"){
                tracker.counter+=1
            }
        }
    }
}


class Tracker : ObservableObject {
    @Published var counter : Int = 0
}

struct NestedObserved: View {
    @State var tracker : SecondTracker
    var body: some View {
        
        VStack {
            Text("Counter : \(tracker.second.counter)")
            Button("Test \(tracker.second.counter)"){
                tracker.second.counter+=1
            }
        }
    }
}
extension NestedObserved {
    @Observable
    class SecondTracker  : ObservableObject {
         var second : Tracker
        init(second: Tracker = Tracker()) {
            self.second = second
        }
    }
}
#Preview {
//    UsingObserved(tracker: Tracker())
   // NestedObserved()
    Text("Ugh")
}
