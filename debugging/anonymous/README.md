# Debugging anonymous user

## English

There are numeraous ways to do debugging for anonymous user as mentioned in Braze documentation.
Here are some tips:

### Finding anonymous user in [User Profile](https://www.braze.com/docs/user_guide/engagement_tools/segments/user_profiles/#access-profiles)

(1) dump [device_id](https://www.braze.com/docs/user_guide/data_and_analytics/user_data_collection/sdk_data_collection) in each platform
(2) search (1)'s device_id in User Profile

Braze document does not mention that you can search user by device_id. However, actually, you can search users by device_id.




## Japanese

匿名ユーザーに関してのデバッグに関しては、Brazeのドキュメントに記載があるように様々な方法がありますが、いくつかのTipsを記載します。

### 匿名ユーザーを、[ユーザー検索画面](https://www.braze.com/docs/user_guide/engagement_tools/segments/user_profiles/#access-profiles)で表示させる

(1) デバッグしたいプラットフォームから対象の匿名ユーザーの[device_id](https://www.braze.com/docs/user_guide/data_and_analytics/user_data_collection/sdk_data_collection) を表示させる。
(2) (1)のdevice_idを、ユーザー情報の検索画面で、検索する。

Brazeのドキュメントは、device_idで検索できるとは記載しておりませんが、device_idでの検索も可能となっています。
