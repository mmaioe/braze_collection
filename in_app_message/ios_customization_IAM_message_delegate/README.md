# English

AppDelegate.swift is an example where some customization is applied by setting up In-app message UI delegate.

https://www.braze.com/docs/developer_guide/platform_integration_guides/swift/in-app_messaging/customization/setting_delegates

This example is setting up the following two delegates:

```
//Customizing display timing
 func inAppMessage(
      _ ui: BrazeInAppMessageUI,
      displayChoiceForMessage message: Braze.InAppMessage
    ) 
```

```
//Customizing button clicks
 func inAppMessage(
    _ ui: BrazeInAppMessageUI, shouldProcess clickAction: Braze.InAppMessage.ClickAction,
    buttonId: String?, message: Braze.InAppMessage, view: InAppMessageView
  ) -> Bool {

```

Also, make sure that you enable In-app message UI delegate by the following code.

```
...
class AppDelegate: UIResponder, UIApplicationDelegate,BrazeInAppMessageUIDelegate
...

 let inAppMessageUI = BrazeInAppMessageUI()
 inAppMessageUI.delegate = self
 braze.inAppMessagePresenter = inAppMessageUI
```

# Japanese

AppDelegate.swiftに、以下のドキュメントに記載のあるIn-app message UI delegateを使用したサンプルを記載しています。

https://www.braze.com/docs/developer_guide/platform_integration_guides/swift/in-app_messaging/customization/setting_delegates

このサンプルでは、以下2つのDelegateを設定しています。

```
//Customizing display timing (IAMの表示のタイミングをカスタマイズする例)
 func inAppMessage(
      _ ui: BrazeInAppMessageUI,
      displayChoiceForMessage message: Braze.InAppMessage
    )
```

```
//Customizing button clicks (IAMのボタンがクリックされた時のカスタマイズ例)
 func inAppMessage(
    _ ui: BrazeInAppMessageUI, shouldProcess clickAction: Braze.InAppMessage.ClickAction,
    buttonId: String?, message: Braze.InAppMessage, view: InAppMessageView
  ) -> Bool {

```

また、以下のコードにより、カスタマイズのDelegateが動作するようになるので、下記のコードが実行されていることを確認ください。

```
...
class AppDelegate: UIResponder, UIApplicationDelegate,BrazeInAppMessageUIDelegate
...
 let inAppMessageUI = BrazeInAppMessageUI()
 inAppMessageUI.delegate = self
 braze.inAppMessagePresenter = inAppMessageUI
```




