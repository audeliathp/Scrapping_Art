require 'rubygems'
require 'nokogiri'
require 'open-uri'

# Scrap crypto symbols into an array
def get_crypto_symbols
  symbols = []
  doc = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))
  
  doc.css("tr.cmc-table-row  > td:nth-child(3) > div").each do |link|
    puts link.content
    symbols << link.content
  end

  return symbols
end

# Scrap crypto prices into an array
def get_crypto_values
  values = []
  doc = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))
  
  doc.css("tr.cmc-table-row  > td:nth-child(5) > a").each do |link|
    puts link.content
    values << link.content
  end

  return values
end

# Merge both arrays into a hash
def merge_symbols_values
  Hash[get_crypto_symbols.zip get_crypto_values] 
end

puts merge_symbols_values
