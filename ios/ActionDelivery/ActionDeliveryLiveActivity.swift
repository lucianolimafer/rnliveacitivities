//
//  ActionDeliveryLiveActivity.swift
//  ActionDelivery
//
//  Created by Luciano Lima Ferreira on 05/05/24.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct ActionDeliveryAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        var dynamicLeadingLabel: String
        var dynamicTrailingLabel: String
        var dynamicBottomLabel: String
    }
    var name: String
}

struct ActionDeliveryLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: ActionDeliveryAttributes.self) { context in
            VStack {
              Text(context.attributes.name)
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                DynamicIslandExpandedRegion(.leading) {
                  Text(context.state.dynamicLeadingLabel)
                }
                DynamicIslandExpandedRegion(.trailing) {
                  Text(context.state.dynamicTrailingLabel)
                }
                DynamicIslandExpandedRegion(.bottom) {
                  Text(context.state.dynamicBottomLabel)
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T")
            } minimal: {
                Text("Min")
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}
