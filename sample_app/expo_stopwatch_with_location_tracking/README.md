
![image](https://raw.githubusercontent.com/mmaioe/braze_collection/refs/heads/main/sample_app/expo_stopwatch/expo_stopwatch.png)

# Japanese

このRepositoryは、https://github.com/mmaioe/braze_collection/tree/main/sample_app/expo_stopwatch のアプリに対して、位置情報を自動で収集する機能の設定を行ったサンプルアプリになります。

## Expoの基本的な設定
https://github.com/mmaioe/braze_collection/tree/main/sample_app/expo_stopwatch を参考ください。

## Expoプログラム関連の記載

### App.tsxの変更

```
import * as Location from 'expo-location';
```
位置情報の取得の許諾を取るためのポップアップを出すために使用する機能

```
Location.requestForegroundPermissionsAsync();
```
位置情報の取得の許諾を取るためのポップアップを表示させる

### app.config.tsの変更

```
"infoPlist": {
      "NSLocationWhenInUseUsageDescription": "位置情報の許諾をください! Please give us your permission for collecting location information !"
}
```
位置情報の許諾を取るポップアップに入れる文言の設定。

```
...
enableGeofence: true,
...
enableAutomaticLocationCollection: true,
enableAutomaticGeofenceRequests: true,
...
```
位置情報関連のフラグをtrueに設定ください。
Geofence関連のフラグもtrueにしています。この辺りをfalseにすると、位置情報の自動収集が動かなかったため、trueにしています。

上記の設定ができると、あとは、Braze SDKが自動で、位置情報を、Brazeサーバー側に送信するようになります。

# English

This is an app which added location tracking capability to https://github.com/mmaioe/braze_collection/tree/main/sample_app/expo_stopwatch  app.

## Basic setting about Expo
Refer https://github.com/mmaioe/braze_collection/tree/main/sample_app/expo_stopwatch

## Expo related programs

### Change App.tsx

```
import * as Location from 'expo-location';
```
Import expo-location service in order to use location tracking related functionality.

```
Location.requestForegroundPermissionsAsync();
```
Shows some popup message to get location tracking permission

### Change app.config.ts

```
"infoPlist": {
      "NSLocationWhenInUseUsageDescription": "位置情報の許諾をください! Please give us your permission for collecting location information !"
}
```
By adding the above information, we can change the comment in the shown popup message for getting location tracking permission.

```
...
enableGeofence: true,
...
enableAutomaticLocationCollection: true,
enableAutomaticGeofenceRequests: true,
...
```
Set true for location tracking related flags in app.config.ts.
Actually, geofence related flags are fine not to be true. But, if you do not set these flags as true, automatic location tracking did not work in this sample app.

Now, Braze SDK automatically collect location data.