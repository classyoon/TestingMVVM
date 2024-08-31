//
//  UsingObserved.swift
//  TestingMVVM
//
//  Created by Conner Yoon on 8/29/24.
//

import SwiftUI

import Combine
//struct UsingObserved: View {
//    @ObservedObject var tracker : Model
//    var body: some View {
//        
//        VStack {
//            Text("Counter : \(tracker.counter)")
//            Button("Test \(tracker.counter)"){
//                tracker.counter+=1
//            }
//        }
//    }
//}


class Model : ObservableObject {
    var numOfInc : Int = 0
    func increaseCounter(_ counter : Int)->Int{
        numOfInc += 1
        if numOfInc > 3 {
            return counter + numOfInc
        }
       return counter + 1
    }
}
class ViewModel  : ObservableObject {
    @Published var model : Model = Model()
    @Published var counter : Int = 0//This needs to be in VM in order to be visable.
    func increaseCounter(){
        counter = model.increaseCounter(counter)
    }
}

struct SimpleView: View {
    @StateObject var vm : ViewModel = ViewModel()
    var body: some View {
        VStack {
            Text("Counter : \(vm.counter)")
            Button("Test \(vm.counter)"){
                vm.increaseCounter()
            }
        }
    }
}


#Preview {
//    UsingObserved(tracker: Tracker())
    SimpleView()
    //Text("Ugh")
}
