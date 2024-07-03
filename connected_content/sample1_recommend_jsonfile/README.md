# sample1_recommend_jsonfile

このサンプルでは、以下のBrazeの機能を試すことができます。
1. Catalog
2. liquid

以下の手順で、試すことが可能です。

# (1) catalog.csvを、お使いのBrazeの環境に取り込む

# (2) メッセージの中で、以下のliquidを書く
The recommended Information:

{% connected_content 
https://raw.githubusercontent.com/mmaioe/braze_connected_content_test/main/recommended_items.json 
:content_type application/json 
:save result
 %}

Hi, the recommended item is {{result}}

Hi, the recommended item is {{result.recommended_items[0]}}!!!!

{% catalog_items Recommend1 {{result.recommended_items[0]}}, {{result.recommended_items[1]}}  %}

{% for item in items %}
{{ item.product_title}}
{% endfor %}
