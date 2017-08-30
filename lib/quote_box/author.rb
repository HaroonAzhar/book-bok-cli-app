class Author
	attr_accessor :name,:dob,:bio,:rating

	
	
	def initialize(name=nil,dob=nil,bio=nil,rating=nil)
		@name=name
		@dob= dob
		
		
		
		@bio=bio
		@rating=rating
    end

	def self.create_by_link(link)
		Scrapper.scrape_author(link)
		
	end

	def display
		puts "Name: #{self.name}"
		puts "Born on: #{self.dob.strip}"
		puts "Bio: #{self.bio}"
		puts "Rating out of 5: #{self.rating}"
			
		end
    
end

