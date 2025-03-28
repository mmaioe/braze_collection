
![image](https://raw.githubusercontent.com/mmaioe/braze_collection/refs/heads/main/sample_app/expo_stopwatch/expo_stopwatch.png)

# Japanese

## Expoの初期設定

### Expoプロジェクトの作成
```
expo init expo_stopwatch 
```
blank (TypeSciprt)を選択

### app.config.tsを作成
app_json_backupと同じ内容で作成。

## braze関連の設定

### braze関連のライブラリのインストール
```
npm install @braze/react-native-sdk
expo install @braze/expo-plugin
```

ドキュメント：https://www.braze.com/docs/ja/developer_guide/platform_integration_guides/react_native/react_sdk_setup/#%E3%82%B9%E3%83%86%E3%83%83%E3%83%97-1braze-%E3%83%A9%E3%82%A4%E3%83%96%E3%83%A9%E3%83%AA%E3%83%BC%E3%82%92%E7%B5%B1%E5%90%88%E3%81%99%E3%82%8B

### braze関連の設定を、app.config.tsに追加

```
plugins: [
    [
      "@braze/expo-plugin",
      {
        androidApiKey: process.env.BRAZE_ANDROID_API_KEY,
        iosApiKey: process.env.BRAZE_IOS_API_KEY,
        baseUrl: process.env.BRAZE_SDK_ENDPOINT,
        sessionTimeout: 60,
        enableGeofence: false,
        enableBrazeIosPush: false,
        enableFirebaseCloudMessaging: false,
        firebaseCloudMessagingSenderId: "YOUR-FCM-SENDER-ID",
        androidHandlePushDeepLinksAutomatically: true,
        enableSdkAuthentication: false,
        logLevel: 3,
        minimumTriggerIntervalInSeconds: 0,
        enableAutomaticLocationCollection: false,
        enableAutomaticGeofenceRequests: false,
        dismissModalOnOutsideTap: true,
        androidPushNotificationHtmlRenderingEnabled: true,
        androidNotificationAccentColor: "#ff3344",
        androidNotificationLargeIcon: "@drawable/custom_app_large_icon",
        androidNotificationSmallIcon: "@drawable/custom_app_small_icon",
      },
    ],
  ]
```

## Expoプログラム関連の記載

### App.tsxの変更

```
import Braze, { ContentCard } from "@braze/react-native-sdk";
```
BrazeをImportすると、Braze関連の機能が使えるようになる。
また、Importの実行だけで、Brazeの初期化が実行される。

```
Braze.changeUser("stopwatch_test_user_v2")
```
changeUserの実行

```
 const [topBanner, setTopBanner] = useState<ContentCard>(); // Content Cards for Braze
```
Brazeのコンテンツカード情報を保持するStateを定義

```
Braze.addListener(Braze.Events.CONTENT_CARDS_UPDATED, async (update) => {
    console.log("content cards got updated")

    for (let i = 0; i <update.cards.length; i++) {
      if(update.cards[i].extras["position"] == "top"){
        console.log(update.cards[i])
        setTopBanner(update.cards[i] as ContentCard)
      }
    }
  });

  Braze.requestContentCardsRefresh();
```
Brazeのコンテンツカードの情報をListenし、新しい情報を取得したら、コンテンツカード用のStateを変更し、アプリのGUIにバナーを表示する。



# English

## Initialization about Expo

### Create an Expo project, expo_stopwatch
```
expo init expo_stopwatch 
```
Select blank (TypeSciprt)

### Create app.config.ts
Create app.config.ts file whose content is the same as app_json_backup.

## Braze related settings

### Install Braze related libraries
```
npm install @braze/react-native-sdk
expo install @braze/expo-plugin
```

Braze's document：https://www.braze.com/docs/ja/developer_guide/platform_integration_guides/react_native/react_sdk_setup/#%E3%82%B9%E3%83%86%E3%83%83%E3%83%97-1braze-%E3%83%A9%E3%82%A4%E3%83%96%E3%83%A9%E3%83%AA%E3%83%BC%E3%82%92%E7%B5%B1%E5%90%88%E3%81%99%E3%82%8B

### Add Braze related settings into app.config.ts

```
plugins: [
    [
      "@braze/expo-plugin",
      {
        androidApiKey: process.env.BRAZE_ANDROID_API_KEY,
        iosApiKey: process.env.BRAZE_IOS_API_KEY,
        baseUrl: process.env.BRAZE_SDK_ENDPOINT,
        sessionTimeout: 60,
        enableGeofence: false,
        enableBrazeIosPush: false,
        enableFirebaseCloudMessaging: false,
        firebaseCloudMessagingSenderId: "YOUR-FCM-SENDER-ID",
        androidHandlePushDeepLinksAutomatically: true,
        enableSdkAuthentication: false,
        logLevel: 3,
        minimumTriggerIntervalInSeconds: 0,
        enableAutomaticLocationCollection: false,
        enableAutomaticGeofenceRequests: false,
        dismissModalOnOutsideTap: true,
        androidPushNotificationHtmlRenderingEnabled: true,
        androidNotificationAccentColor: "#ff3344",
        androidNotificationLargeIcon: "@drawable/custom_app_large_icon",
        androidNotificationSmallIcon: "@drawable/custom_app_small_icon",
      },
    ],
  ]
```

## Develop Expo related program

### Change App.tsx

```
import Braze, { ContentCard } from "@braze/react-native-sdk";
```
By Importing Braze library, you can start to use Braze related functionality.
Also, Initializing Braze SDK is done automatically.。

```
Braze.changeUser("stopwatch_test_user_v2")
```
Execute changeUser.

```
 const [topBanner, setTopBanner] = useState<ContentCard>(); // Content Cards for Braze
```
Define a state which maintain Braze Content card information.

```
Braze.addListener(Braze.Events.CONTENT_CARDS_UPDATED, async (update) => {
    console.log("content cards got updated")

    for (let i = 0; i <update.cards.length; i++) {
      if(update.cards[i].extras["position"] == "top"){
        console.log(update.cards[i])
        setTopBanner(update.cards[i] as ContentCard)
      }
    }
  });

  Braze.requestContentCardsRefresh();
```
Listen for Braze content card update. 
Once we get Braze content card update, we update the state for content card.
Then, Top banner for mobile app will display.
