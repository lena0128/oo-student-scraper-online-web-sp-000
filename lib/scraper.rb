require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    students_info = []
    html = Notogiri::HTML(open(index_url))
    html.css(".student-card").map do |student|
      student_hash = {
        name: student.css("h4.student-name").text,
        location: student.css("p.student_location").text
        profile_url: "http://students.learn.co/" + student.css("a").attribute("href")
      }
      student_info << student_hash
  end
  student_info
end

  def self.scrape_profile_page(profile_url)

  end

end
