//
//  SPWidgetLiveActivity.swift
//  SPWidget
//
//  Created by Fatih Akbulut on 1/22/24.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct SPWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct SPWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: SPWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension SPWidgetAttributes {
    fileprivate static var preview: SPWidgetAttributes {
        SPWidgetAttributes(name: "World")
    }
}

extension SPWidgetAttributes.ContentState {
    fileprivate static var smiley: SPWidgetAttributes.ContentState {
        SPWidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: SPWidgetAttributes.ContentState {
         SPWidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: SPWidgetAttributes.preview) {
   SPWidgetLiveActivity()
} contentStates: {
    SPWidgetAttributes.ContentState.smiley
    SPWidgetAttributes.ContentState.starEyes
}
