class Qoute
	attr_accessor :content,:likes,:scripture_it_belongs_to,:author
	attr_writer   :author_link

    def self.qoute_interface
    	#qoute_of_the_day
    	# puts "---------------------------------------------------------------------------------------------------------------------------------------------------------------------"
    	# puts "Qoutes of the day"
    	# puts "---------------------------------------------------------------------------------------------------------------------------------------------------------------------"
        selection=nil
        while selection!="exit"
    		puts "Enter a keyword to search qoutes for"
    		puts "Enter popular search for popular qoutes by likes"
    		puts "Enter exit to quit searching for qoutes"
    		selection=gets.strip.downcase
    		case selection
    			when "popular"
    			when  "exit" 
    		       break  	 
    			else 
    				## scrape keywords
    		end
    	end
    end
	def self.scrape_popular
		
	end
	def self.scrape_keywords
		
	end
	
end