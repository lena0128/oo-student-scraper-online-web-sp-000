require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    students_info = []
    doc = Nokogiri::HTML(open(index_url))
    doc.css("div.student-card").each do |card|
      student_hash = {
        name: student.css("h4.student-name").text,
        location: student.css("p.student_location").text,
        profile_url: "http://students.learn.co/#{student.css("a").attribute("href").value}"
      }
      student_info << student_hash
  end
  student_info
end

def self.scrape_profile_page(profile_url)
 doc = Nokogiri::HTML(open(profile_url))

 student_details = {}
end


end
