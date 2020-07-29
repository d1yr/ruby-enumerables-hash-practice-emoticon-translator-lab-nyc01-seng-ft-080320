require 'yaml'
require 'pry'


def load_library(file_path)
  emoticons = YAML.load_file('./lib/emoticons.yml')


  # Hash must use the => syntax to pass tests.
  # "get_meaning": {} will not pass the test suite.
  return_hash = {
    "get_meaning" => {},
    "get_emoticon" => {},
  }

  emoticons.each do |meaning, translations|
    return_hash["get_meaning"][translations[1]] = meaning
    return_hash["get_emoticon"][translations[0]] = translations[1]
  end
  return_hash
end

def get_japanese_emoticon(file_path, emoticon)
  emoticons = load_library(file_path)
  emoticons["Japanese"].each do |english_emoticon, japanese_emoticon|
    if emoticon == english_emoticon
      return japanese_emoticon
    end
  end
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, emoticon)
  emoticons = load_library(file_path)
  emoticons["English"].each do |japanese_emoticon, english_meaning|
    if emoticon == japanese_emoticon
      return english_meaning
    end
  end
  return "Sorry, that emoticon was not found"
end