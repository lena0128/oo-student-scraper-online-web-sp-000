require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    students_info = []
    doc = Nokogiri::HTML(open(index_url))
    doc.css(".student-card").each do |card|
      student_hash = {
        name: card.css(".student-name").text,
        location: card.css(".student_location").text,
        profile_url: card.css("a")[0]["href"]
      }
      students_info << student_hash
  end
  students_info
end

def self.scrape_profile_page(profile_url)
 doc = Nokogiri::HTML(open(profile_url))

 student_details = {}
end


end
