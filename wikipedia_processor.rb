require 'nokogiri'
require 'pry'

def parse_pages_and_titles
  doc = Nokogiri::XML(File.read("enwiki-latest-stub-articles1.xml"))
  title_nodes = doc.xpath("//title").select{|e| e.text.match(/Afghanistan|America/)}
  output = title_nodes.collect{|e| "#{e.parent.search("id").first.text}, #{e.text}"}

  File.open("pages.txt", "w+") do |f|
    output.each do |line|
      f.write "#{line}\n"
    end
  end
end

parse_pages_and_titles