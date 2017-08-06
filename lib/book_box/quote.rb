class Qoute
	attr_accessor :content,:likes,:scripture_it_belongs_to,:author
	attr_writer   :author_link

	def initialize(cont=nil,likes=nil,book=nil,author=nil)
		@content=cont
		@likes=likes
		@scripture_it_belongs_to=book
		@author=author

	end

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
    				  self.scrape_and_display_popular_list
    				  #set instructions
    			when  "exit" 
    		           break  	 
    			else 
    				self.scrape_and_display_keywords_list(selection)
    				## scrape keywords
    				#set instructions
    		end
    		#second selection 1 author or more info
    	end
    end

	def self.scrape_popular_list
		qoutes=[]
		page=Nokogiri::HTML(open("https://www.goodreads.com/quotes?page=1"))
		qoute_list=page.css("div.quote")
		qoute_list.each_with_index do |qoute,index|
			q=Qoute.new(
				qoute.css(".quoteText").text,
				qoute.css("a[title='View this quote']").text,
				qoute.css("a[href^='/work']").text)
                 
               qoutes<<q
			 puts "#{q.content}"
			  binding.pry

			#scrapes the gref for author and then calls create_with_link
			#Nokogiri::HTML(open("https://www.goodreads.com/quotes?page=1")).css("div.quote").css("a.authorOrTitle")["href"]

		end
		qoutes
	end
	
	def display_list(list)
		
		#displayed qoute 
			
	end


		
        
         #tells: enter a 2 digit value.The fist integer corresponds to the qoute's number in the list and the second number 
	
	def self.scrape_and_display_keywords_list(keyword)
		qoutes=[]

		#displayed qoute content
         #tells: enter a 2 digit value.The fist integer corresponds to the qoute's number in the list and the second number 
	end
	def display
		puts "#{}"
		puts "#{}"
		puts "#{}"
		puts "#{}"
	end
	
end