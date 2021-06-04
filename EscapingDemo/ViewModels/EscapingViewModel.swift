//
//  EscapingViewModel.swift
//  EscapingDemo
//
//  Created by Fred Javalera on 6/3/21.
//

import Foundation

class EscapingViewModel: ObservableObject {
  
  @Published var text: String = "Hello"
 
  func getData() {
    downloadData5 { [weak self] returnedResult in
      self?.text = returnedResult.data
    }
  }
  
  func downloadData() -> String {
    return "New Data!"
  }
  
  func downloadData2(completionHandler: (_ data: String) -> Void) {
      completionHandler("New data!")
  }
  
  func downloadData3(completionHandler: @escaping (_ data: String) -> ()) {
    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
      completionHandler("New data!")
    }
  }
  
  func downloadData4(completionHandler: @escaping (DownloadResult) -> ()) {
    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
      let result = DownloadResult(data: "New Data!")
      completionHandler(result)
    }
  }
  
  func downloadData5(completionHandler: @escaping DownloadCompletion) {
    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
      let result = DownloadResult(data: "New Data!")
      completionHandler(result)
    }
  }
  
}

typealias DownloadCompletion = (DownloadResult) -> ()

struct DownloadResult {
  let data: String
}
