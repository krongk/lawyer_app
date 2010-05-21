require 'nokogiri'
require 'open-uri'

  # Get a Nokogiri::HTML:Document for the page we¡¯re interested in...
  url="bar_list.html"
  doc = Nokogiri::HTML(open(url))

  doc.css("tr").each do |line|
    if line.css('td').size ==5
      arr =[]
      line.css('td').each do |td|
         arr << td.content
       end
        arr[0]
    end
  end
  
name = "Aaron'Jr, John Bland"
p name.strip.split(',').reverse.join(' ').gsub(/'/,'')

  