class Author
	attr_accessor :name,:dob,:dod,:website,:genre,:bio,:rating

	
	def self.author_interface
		
	end
	def initialize(name=nil,dob==nil,dod=nil,website=nil,genre=nil,bio=nil,rating=nil)
		@name=name
		@dob= dob
		@dod=dod
		@website=website
		@genre=genre
		@bio=bio
		@rating=rating

			
	end
	end
	def self.create_by_link(link)
		page=Nokogiri::HTML(open("https://www.goodreads.com#{link}"))


	end
end
