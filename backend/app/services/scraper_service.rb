require 'nokogiri'
require 'httparty'

class ScraperService
    def initialize(url)
        @url = url
        begin
            @response = Nokogiri::HTML5(HTTParty.get(url,  {
                headers: { 
                    "User-Agent" => "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36" 
                },
              }))
        rescue StandardError => e
            p e
        end
    end

    def call
        {
            "url" => @url,
            "title" =>  title,
            "price" =>  price,
            "categories" => categories,
            "sizes" => sizes,
            "details" => details,
            "description" => description
        }
    end

    def response
        @response
    end

    private

    def title
        return @response.css('.VU-ZEz').map(&:content)
    end

    def price
        return @response.css('.CxhGGd').map(&:content) 
    end

    def categories
        return @response.css('.R0cyWM').map(&:content) 
    end

    def sizes
        return @response.css('.E1E-3Z').map(&:content)
    end

    def description
        return @response.css('.w9jEaj').map(&:content)
    end

    def details
        detail = {}
        @response.css('._8vsVX1').children.each do |row|
            key = row.css('._9NUIO9').text
            value = row.css('.-gXFvC').text
            detail[key] = value if key.present? && value.present?
        end

        detail
    end
end
