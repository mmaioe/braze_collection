# sample1_recommend_jsonfile

## English

In this asset, you can try the following Braze's functionalities:
1. Catalog
2. liquid
3. Connected Content

   This assets simply call JSON file hosting in this gihub repository.

   This asset is not an example which is using API Server (Connected content API).

You can try this asset by following the below steps:

## (1) upload catalog.csv into your Braze environment
When uploading catalog.csv, save that data as "Recommend1".
the liquid of (2) step is referring this csv data as "Recommend1". So, name it as "Recommend1".

## (2) write some liquid like the following in the message for using Connected content.
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



## Japanese 

このサンプルでは、以下のBrazeの機能を試すことができます。
1. Catalog
2. liquid
3. Connected Content
   
   gituhb上にHostingしたJSONファイルを呼び出すだけの例になります。

   APIサーバーの開発をした例ではありません。

以下の手順で、試すことが可能です。

## (1) catalog.csvを、お使いのBrazeの環境に取り込む
Brazeの環境に取り込む際に、"Recommend1"という名前で保存ください。
(2)のliquidでは、"Recommend1"という名前で、カタログを参照しています。

## (2) メッセージの中で、以下のliquidを書く
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
