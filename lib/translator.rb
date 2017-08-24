require "yaml"
require "pry"

def load_library(yaml_file)
  emoji_hash = {"get_meaning" => {}, "get_emoticon" => {}}
  library = YAML.load_file(yaml_file)
  library.each do |translation, emoticons|
    english = emoticons[0]
    japanese = emoticons[1]
    emoji_hash["get_meaning"][japanese] = translation
    emoji_hash["get_emoticon"][english] = japanese
    #get_meaning gives you the english word assosiated with the japanese emoji
    #get_emoticon gives you the enlish emoji and gives the japanese emoji it corresponds to
  end
  emoji_hash
end

def get_japanese_emoticon(file_path, emoticon)
  library_hash = load_library(file_path)
  # if library_hash["get_meaning"].include?(emoticon)
  #   library_hash["get_meaning"][emoticon]
  # else
  #    puts "I'm sorry, I dont know what that emoticon means!"
  # end
  library_hash["get_emoticon"].each do |english_word, jap_emoji|
    if english_word == emoticon
      return jap_emoji
    end
  end
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, emoticon)
  library_hash = load_library(file_path)
  #returns english meaning of jap emoji
  library_hash["get_meaning"].each do |jap_emoji, english_word|
    if jap_emoji == emoticon
      return english_word
    end
  end
  return "Sorry, that emoticon was not found"
end
