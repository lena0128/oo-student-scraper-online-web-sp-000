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
        profile_url: card.css("a").attribute("href").value
      }
      students_info << student_hash
  end
  students_info
end

def self.scrape_profile_page(profile_url)

    html = open(profile_url)
    doc = Nokogiri::HTML(html)
    student = {}
    student[:profile_quote] = doc.css('.profile-quote').text
    student[:bio] = doc.css('.description-holder p').text
    doc.css('.social-icon-container a').each do |tag|
      url = tag.attribute('href').value
      if url.include?("twitter")
        student[:twitter] = url
      elsif url.include?('linkedin')
        student[:linkedin] = url
      elsif url.include?('github')
        student[:github] = url
      else
        student[:blog] = url
      end
    end
    student
  end	  end


end	end
