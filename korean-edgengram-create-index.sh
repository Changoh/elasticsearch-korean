curl -XPUT '127.0.0.1:9222/test' -d '{
  "settings" : {
    "analysis": {
      "tokenizer" : {
        "autocomplete_tokenizer" : {
          "type" : "edgeNGram",
          "min_gram" : "1",
          "max_gram" : "30",
          "token_chars": ["letter", "digit"]
        }
      },
      "char_filter" : {
        "nfd_normalizer" : {
          "type" : "icu_normalizer",
          "name": "nfc",
          "mode": "decompose"
        }
      },
      "analyzer": {
        "autocomplete_analyzer": {
          "type": "custom",
          "char_filter": ["nfd_normalizer"],
          "tokenizer": "autocomplete_tokenizer"
        }
      }
    }
  }
}'

