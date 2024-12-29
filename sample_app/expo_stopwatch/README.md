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



# English

## Initialization about Expo

### Create an Expo project, expo_stopwatch
```
expo init expo_stopwatch 
```
blank (TypeSciprt)を選択

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

