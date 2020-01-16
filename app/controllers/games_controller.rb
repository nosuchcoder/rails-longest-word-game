require 'open-uri'
require 'json'

WAGON_URL = "https://wagon-dictionary.herokuapp.com/"

class GamesController < ApplicationController
  def new
    letter_array = []
    while letter_array.size < 9
    @letters = letter_array << ('A'..'Z').to_a[rand(26)]
    end
  end

  def score
    @word = params[:word]
    @letters = params[:letters]
  end

  def isWord
    url = WAGON_URL + @word
    check_word = open(url).read
    check_word = JSON.parse(check_word)
    found_word = check_word["found"]
  end

end
