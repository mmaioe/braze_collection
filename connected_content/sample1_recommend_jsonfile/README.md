# sample1_recommend_jsonfile


# liquid例
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
