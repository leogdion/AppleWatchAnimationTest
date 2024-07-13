//
//  ContentView.swift
//  animation-test Watch App
//
//  Created by Leo Dion on 7/13/24.
//

import SwiftUI
import AVKit
import AVFoundation

struct LoopingVideoView: View {
  @State var index = 1
  let timerPublisher = Timer.publish(every: 0.08, on: .current, in: .common).autoconnect()
  var imageName : String {
    let suffixIndex = (index - 1).remainderReportingOverflow(dividingBy: 9).partialValue + 1
    return "transparent_treadmill000\(suffixIndex)"
  }

    init() {
      
    }

  var body: some View {
    Image(self.imageName)
      .resizable(resizingMode: .stretch)
      .aspectRatio(contentMode: .fit)
      .onReceive(self.timerPublisher) { date in
        self.index += 1
      }
  }
}

#Preview {
  LoopingVideoView()
}
