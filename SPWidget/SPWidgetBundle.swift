//
//  SPWidgetBundle.swift
//  SPWidget
//
//  Created by Fatih Akbulut on 1/22/24.
//

import WidgetKit
import SwiftUI

@main
struct SPWidgetBundle: WidgetBundle {
    var body: some Widget {
        SPWidget()
        SPWidgetLiveActivity()
    }
}
