require 'yaml'
require 'pry'


def load_library(file_path)
  emoticons = YAML.load_file('./lib/emoticons.yml')
    table = {:japanese => {}, :english => {}}
emoticons.each do |meaning, translations|
    table["English"][translations[1]] = "Name:#{meaning}"
    table["Japanese"][translations[0]] = translations[1] 
  end
  table
  #binding.pry
end

def get_japanese_emoticon(file_path, emoticon)
  emoticons = load_library(file_path)
  emoticons[:japanese].each do |english_emoticon, japanese_emoticon|
    if emoticon == english_emoticon
      return japanese_emoticon
    end
  end
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, emoticon)
  emoticons = load_library(file_path)
  emoticons[:english].each do |japanese_emoticon, english_meaning|
    if emoticon == japanese_emoticon
      return english_meaning
    end
  end
  return "Sorry, that emoticon was not found"
end