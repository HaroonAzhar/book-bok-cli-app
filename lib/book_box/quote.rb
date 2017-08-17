require 'pry'
class Quote
	attr_accessor :content,:likes,:scripture_it_belongs_to,:author, :author_link
	attr_writer  
    
	def initialize(cont,likes,book,author=nil)
		@content=cont
		@likes=likes
		@scripture_it_belongs_to=book
		@author=author

	end

	def quote_info_selection_instructions
		puts " enter a 2 digit number"
		puts " the first number represent the coresponding number of qoute in the list"
		puts " second number represent the action you want, which is one the 2 option 1: more information about the qoute and 2: information regarding the author"
		puts " enter next to load more qoutes "
		puts " else "
	end
	def display_nth_author_from_list()
		
	end

    def self.quote_interface
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
    				  list=quote_info_selection_instructions
    				  
    				  	quote_info_selection_instructions
    				     opt=gets.strip
    				      n=opt/10
    				      opt=opt%10
    				    if opt==1
    				   	 #qoute_list[n]'s more info
    				   	else
    				   	 #find_or_create_author	
    				   	end
    				  	
    				   puts "press any key to continue"
    				   gets.strip
    				   



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
		quotes=[]
		page=Nokogiri::HTML(open("https://www.goodreads.com/quotes?page=1"))
		quote_list=page.css("div.quoteDetails")
		quote_list.each_with_index do |quote,index|
			script= nil
			if quote.css("a[href^='/work']") 
				    script=quote.css("a[href^='/work']")[0]['href'] 
		     else 
		     	script=quote.css("a[href^='/work']")
		     end
			q=Quote.new(
				quote.css(".quoteText").text,
				quote.css("a[title='View this quote']").text,
				 script)
			    q.author_link= quote.css("a[href^='/author']")[0]['href']
                 
               quotes<<q
               
               

			  puts q.content
			  puts q.likes
			  puts "SCRIPTURE :::: #{q.scripture_it_belongs_to}"
			  puts  " AUTHO_LINK ::::: #{q.author_link}"
			  puts "weeeeeeeeeeeeeeeeeeeeeeeeeeeeeee--------------------------------------------------------------------------------"
			  
             #Quote.scrape_popular_list
             		#? quote.css("a[href^='/work']")[0]['href']:  quote.css("a[href^='/work']")[0]['href']
			#scrapes the gref for author and then calls create_with_link
			#Nokogiri::HTML(open("https://www.goodreads.com/quotes?page=1")).css("div.quote").css("a.authorOrTitle")["href"]

		end
		
	end

	def self.test
		page=Nokogiri::HTML(open("https://www.goodreads.com/quotes?page=1"))
		quote_list=page.css("div.quoteDetails")
		quote_list.each_with_index do |quote,index|
			puts "-------------------------------------------"
			
			check_it=quote.css("a[href^='/work']").class
			binding.pry

		end
	end
	
	def display_list(list)
		
		#displayed qoute 
		
			
	end


		
        
         #tells: enter a 2 digit value.The fist integer corresponds to the qoute's number in the list and the second number 
	
	def self.scrape_and_display_keywords_list(keyword)
		quotes=[]

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