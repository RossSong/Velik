//
//  StopButtonViewModel.swift
//  Fietscomputer
//
//  Created by Grigory Avdyushin on 05/06/2020.
//  Copyright © 2020 Grigory Avdyushin. All rights reserved.
//

import SwiftUI

class StopButtonViewModel: ViewModel, ObservableObject {
    @Published var isVisible = false

    override init() {
        super.init()

        rideService.state
            .sink {
                switch $0 {
                case .idle, .stopped:
                    withAnimation { self.isVisible = false }
                case .paused:
                    withAnimation { self.isVisible = true }
                case .running:
                    withAnimation { self.isVisible = true }
                }
        }
        .store(in: &cancellables)
    }
}
