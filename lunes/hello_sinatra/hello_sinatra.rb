require "sinatra"

def count_vowels(name)
  "My name is #{name} and it has #{name.scan(/[aeiow]/).count} vowels."
end

get "/" do
  count_vowels("Francisco Javier")
end