//
//  UsingObserved.swift
//  TestingMVVM
//
//  Created by Conner Yoon on 8/29/24.
//

import SwiftUI

import Combine
struct UsingObserved: View {
    @ObservedObject var tracker : Model
    var body: some View {
        
        VStack {
            Text("Counter : \(tracker.counter)")
            Button("Test \(tracker.counter)"){
                tracker.counter+=1
            }
        }
    }
}


class Model : ObservableObject {
    @Published var counter : Int = 0
    func increaseCounter(){
        counter+=1
    }
    func getNum()-> Int{
        return counter
    }
}
class ViewModel  : ObservableObject {
    @Published var model : Model = Model()
    func increaseCounter(){
        model.increaseCounter()
    }
//    func getText()-> String{
//        return "\(model.getNum())"
//    }
    var counterText : String {
        "\(model.counter)"
    }
}

struct SimpleView: View {
    @StateObject var vm : ViewModel = ViewModel()
    var body: some View {
        VStack {
            Text("Counter : \(vm.counterText)")
            Button("Test \(vm.counterText)"){
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
