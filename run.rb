require 'nokogiri'
require 'open-uri'
require "benchmark"
require 'colorize'

url = 'https://github.com/sparklemotion/nokogiri'
doc = Nokogiri::HTML(File.read('page.html'))
links = []
time = Benchmark.measure do
    links = doc.css('a').reduce([]){|memo,value| memo.push(value); memo}
end

puts "links: %s, time %s, url: %s" % [links.size.to_s.green, time.real.round(3), url]
