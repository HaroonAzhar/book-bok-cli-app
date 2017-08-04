class Qoute
	attr_accessor :content,:likes,:scripture_it_belongs_to,:author
	attr_writer   :author_link

    def self.qoute_interface
    	puts "---------------------------------------------------------------------------------------------------------------------------------------------------------------------"
    	puts "Qoutes of the day"
    	puts "---------------------------------------------------------------------------------------------------------------------------------------------------------------------"

    	puts "Enter a keyword to search qoutes for"
    	puts "Enter popular search for popular qoutes by likes"

    	
    end
	def self.create_by_scrape(link)
		
	end
	
end