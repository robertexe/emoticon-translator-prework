require "yaml"

def load_library(file)
  emojis = YAML.load_file("lib/emoticons.yml")
  result = {
    "get_meaning" => {},
    "get_emoticon" => {},
  }
  emojis.each do |definition, emoji|
    english = emoji[0]
    japanese = emoji[1]
    result["get_meaning"][japanese] = definition
    result["get_emoticon"][english] = japanese
  end
  result
end

def get_japanese_emoticon(file, emoticon)
  emojis = load_library(file)
  if emojis["get_emoticon"][emoticon] == nil
    return "Sorry, that emoticon was not found"
  else
    emojis["get_emoticon"][emoticon]
  end
end

def get_english_meaning(file, emoticon)
  emojis = load_library(file)
  if emojis["get_meaning"][emoticon] == nil
    return "Sorry, that emoticon was not found"
  else
    emojis["get_meaning"][emoticon]
  end
end
