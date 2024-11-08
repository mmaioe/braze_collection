## English

LiveActivity in Braze SDK supports two ways to enable Live Activity, REMOTE and LOCAL.

https://www.braze.com/docs/developer_guide/platform_integration_guides/swift/live_activities/live_activities

This document shows an example to use LOCAL approach.

(1) Create Live Activity Wiget

Files → New → Target → Widget Extension

For example, I named it as "BreakingNews".

(2) modify Live Activity Widget code
In this example, we modify BreakingNews.swift.
This file is created by (1) step.

```
//
//  BreakingNews.swift
//  BreakingNews
//
//  Created by Mao Ito on 2024/11/08.
//

import WidgetKit
import SwiftUI

struct BreakingNews: Widget{
    var body: some WidgetConfiguration{
        //        ActivityConfiguration(attributeType: OrderAttributes.self){ context in
        ActivityConfiguration(for:BreakingNewsAttributes.self){ context in
            ZStack{
                RoundedRectangle(cornerRadius: 15, style: .continuous).fill(Color("Green").gradient)
            }
        }dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Breaking News ")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("\(context.attributes.NewsType) !")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Tapp it!")
                    // more content
                }
            } compactLeading: {
                if(context.state.breackingNews == BreakingNewsInformation.Urgent){
                    Text("Breaking")
                }else{
                    Text("Non")
                }
            } compactTrailing: {
                if(context.state.breackingNews == BreakingNewsInformation.Urgent){
                    Text("News!")
                }else{
                    Text("Breaking!")
                }
            } minimal: {
                Text("minimaul")
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
    
}

```

3. Create Model folder in the parent project

4. Create BreakingNewsAttributes.swift under Step3's folder
Create a file, Model/BreakingNewsAttributes.swift

```
import SwiftUI
import ActivityKit
import BrazeKit

struct BreakingNewsAttributes: ActivityAttributes, BrazeLiveActivityAttributes {
    struct ContentState: Codable, Hashable{
        var breackingNews: BreakingNewsInformation = .NotUrgent
    }
    var NewsType: String
    var brazeActivityId: String?
}

enum BreakingNewsInformation: String, CaseIterable, Codable, Equatable{
    case Urgent = "Urgent"
    case NotUrgent = "Not Urgent"
} 
```

5. Include BreakingNewsExtension in Target MemberShip in XCode
BreakingNewsExtension is created by Step1.

6. Launch Live Activity Locally

```
 let activityAttributes = BreakingNewsAttributes(message: "none")
        let contentState = BreakingNewsAttributes.ContentState(breackingNews:BreakingNewsInformation.NotUrgent)
        let activityContent = ActivityContent(state: contentState, staleDate: nil)
        if let activity = try? Activity.request(attributes: activityAttributes,
                                                   content: activityContent,
             // Setting your pushType as .token allows the Activity to generate push tokens for the server to watch.
                                                pushType: .token) {
            // Register your Live Activity with Braze using the pushTokenTag.
            // This method returns a Swift background task.
            // You may keep a reference to this task if you need to cancel it wherever appropriate, or ignore the return value if you wish.
            let liveActivityObserver: Task? = AppDelegate.braze?.liveActivities.launchActivity(pushTokenTag: "breakingNewsPar10", activity: activity)
```

7. Send Braze API request to change BreakingNews status

```
URL: https://xxx/messages/live_activity/update

RequestBody:
{
    "app_id": "ee9b5f3f-7db1-4965-a6a8-34292a854b40",
    "activity_id": "breakingNewsPar10",
    "content_state": {
        "breackingNews": "Not Urgent"
    },
    "notification": {
        "alert": {
            "body": "someone got married !",
            "title": "Breaking News"
        }
    },
    "end_activity": false
}

```





## Japanese




