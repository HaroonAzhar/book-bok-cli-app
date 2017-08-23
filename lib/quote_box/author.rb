class Author
	attr_accessor :name,:dob,:bio,:rating

	
	
	def initialize(name=nil,dob=nil,bio=nil,rating=nil)
		@name=name
		@dob= dob
		
		
		
		@bio=bio
		@rating=rating
    end

	def self.create_by_link(link)
		
		page=Nokogiri::HTML(open("https://www.goodreads.com#{link}"))
		self.new(
			 page.css(".authorName span[itemprop='name']")[0].text,
			 page.css("div.dataItem[itemprop='birthDate']").text,
			 page.css("span[id^='freeTextContainerauthor'][style^='display']").text,
			 page.css("span.average[itemprop='ratingValue']").text,
		     )
	end

	def display
		puts self.name
		puts self.dob
		puts self.bio
		puts self.rating
			
		end
    
end

