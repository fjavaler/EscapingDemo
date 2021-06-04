//
//  ContentView.swift
//  EscapingDemo
//
//  Created by Fred Javalera on 6/3/21.
//

import SwiftUI

struct EscapingView: View {

  // MARK: Properties
  @StateObject var vm = EscapingViewModel()
  
  // MARK: Body
  var body: some View {
    
    Text(vm.text)
      .font(.largeTitle)
      .fontWeight(.semibold)
      .foregroundColor(.blue)
      .onTapGesture {
        vm.getData()
      }
    
  }
  
}

// MARK: Preview
struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    EscapingView()
  }
}
