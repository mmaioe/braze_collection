import { ExpoConfig, ConfigContext } from "@expo/config";

export default ({ config }: ConfigContext): ExpoConfig => ({
  ...config,
  name: "expo_stopwatch",
  slug: "expo_stopwatch",
  version: "1.0.0",
  orientation: "portrait",
  icon: "./assets/icon.png",
  userInterfaceStyle: "light",
  splash: {
    image: "./assets/splash-icon.png",
    resizeMode: "contain",
    backgroundColor: "#ffffff",
  },
  ios: {
    supportsTablet: true,
    bundleIdentifier: "com.mmaioe.expo-stopwatch",
    "infoPlist": {
      "NSLocationWhenInUseUsageDescription": "位置情報の許諾をください! Please give us your permission for collecting location information !"
    }
  },
  android: {
    adaptiveIcon: {
      foregroundImage: "./assets/adaptive-icon.png",
      backgroundColor: "#ffffff",
    },
    permissions: [
      "android.permission.ACCESS_NETWORK_STATE",
      "android.permission.INTERNET",
    ],
    package: "com.mmaioe.expo_stopwatch",
  },
  web: {
    favicon: "./assets/favicon.png",
  },
  plugins: [
    [
      "@braze/expo-plugin",
      {
        androidApiKey: process.env.BRAZE_ANDROID_API_KEY,
        iosApiKey: process.env.BRAZE_IOS_API_KEY,
        baseUrl: process.env.BRAZE_SDK_ENDPOINT,
        sessionTimeout: 60,
        enableGeofence: true,
        enableBrazeIosPush: false,
        enableFirebaseCloudMessaging: false,
        firebaseCloudMessagingSenderId: "YOUR-FCM-SENDER-ID",
        androidHandlePushDeepLinksAutomatically: true,
        enableSdkAuthentication: false,
        logLevel: 3,
        minimumTriggerIntervalInSeconds: 0,
        enableAutomaticLocationCollection: true,
        enableAutomaticGeofenceRequests: true,
        dismissModalOnOutsideTap: true,
        androidPushNotificationHtmlRenderingEnabled: true,
        androidNotificationAccentColor: "#ff3344",
        androidNotificationLargeIcon: "@drawable/custom_app_large_icon",
        androidNotificationSmallIcon: "@drawable/custom_app_small_icon",
      },
    ],
  ]
});
