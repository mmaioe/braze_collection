# sample1_recommend_jsonfile

このサンプルでは、以下のBrazeの機能を試すことができます。
1. Catalog
2. liquid
3. Connected Content
   
   gituhb上にHostingしたJSONファイルを呼び出すだけの例になります。

   APIサーバーの開発をした例ではありません。

以下の手順で、試すことが可能です。

# (1) catalog.csvを、お使いのBrazeの環境に取り込む
Brazeの環境に取り込む際に、"Recommend1"という名前で保存ください。
(2)のliquidでは、"Recommend1"という名前で、カタログを参照しています。

# (2) メッセージの中で、以下のliquidを書く
The recommended Information:

{% connected_content 
https://raw.githubusercontent.com/mmaioe/braze_collection/main/connected_content/sample1_recommend_jsonfile/recommended_items.json
:content_type application/json 
:save result
 %}

Hi, the recommended item is {{result}}

Hi, the recommended item is {{result.recommended_items[0]}}!!!!

{% catalog_items Recommend1 {{result.recommended_items[0]}} {{result.recommended_items[1]}}  %}

{% for item in items %}
{{ item.product_title}}
{% endfor %}
