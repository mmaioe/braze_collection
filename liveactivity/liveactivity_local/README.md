## Note (注意)

This is just an example where I tried locall in my laptop.
So, please be careful on that.

このサンプルはあくまで、ローカルで試してみた程度のサンプルになりますので、参考程度に見てください。

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

Braze SDKによるLive Activityには、REMOTE と LOCALという２種類の方法がサポートされておりますが、本資料では、LOCALの方法を記載しています。

https://www.braze.com/docs/developer_guide/platform_integration_guides/swift/live_activities/live_activities

本Directoryでは、LOCALを使った方法をご紹介します。

(1) Live Activity Wigetを作成します。

Files → New → Target → Widget Extension

例えば、"BreakingNews"という名前をつけます。

(2) Live Activity Widget codeを修正

この例では、BreakingNews.swiftを修正しました。

この辺りは、BrazeのSDKとは直接的にあまり関係ないところになりますので、他のネットの資料も豊富にあるかと思います。

BreakingNews.swiftは、(1)のステップで作成されているファイルです。

```
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

3. Modelという名前のフォルダを、Live Activityを使う側のプロジェクトで作成する 

以下のようなイメージとなります。

```
- Model
- AppDelegate.swift
- SceneDelegate.swift
...

```

4. Step3で作成したModelというフォルダの下に、BreakingNewsAttributes.swiftというファイルを作成する。
 
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

5. BreakingNewsAttributes.swiftのファイルを選択した状態で、XCode上のTarget MembershipからBreakingNewsExtensionを選択する

BreakingNewsExtensionの選択肢は、Step1で作成されます。

6. Live ActivityをLOCALで起動する。

以下のコードを、必要なタイミングで指定する。

```
let activityAttributes = BreakingNewsAttributes(NewsType: "Marriage")
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
            NSLog("activity_id="+activity.id);
            
```

7. Braze APIを使って、BreakingNewsのステータスを変更する 

Send Braze API request to change BreakingNews status

```
URL: https://xxx/messages/live_activity/update

RequestBody:
{
    "app_id": "xxxxx",
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




