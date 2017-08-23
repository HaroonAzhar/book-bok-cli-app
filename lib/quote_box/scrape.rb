class Scrapper 
	 @@curr_pg=1





	 def self.curr_pg
		@@curr_pg
	end
	
	def self.curr_pg=(val)
		@@curr_pg=val
	end

     def self.scrape_keywords_list(phrase)
		page=Nokogiri::HTML(open(phrase_to_search_string(phrase)))
		list=scrape_quote_lists_from_doc(page)
	  end

	   


	def self.scrape_popular_list
		page=Nokogiri::HTML(open("https://www.goodreads.com/quotes?page=#{@@curr_pg}"))
		list=scrape_quote_lists_from_doc(page)
     end

   private 

	   def self.scrape_quote_lists_from_doc(doc)
		quotes=[]
		quote_list=doc.css("div.quoteDetails")
		quote_list.each do |quote|
			
			q=Quote.new(
				quote.css(".quoteText").text.strip.split("\n")[0],
				quote.css("a[title='View this quote']").text,
				quote.css(".quoteText").text.strip.split("\n")[4],
				quote.css(".quoteText").text.strip.split("\n")[2])
                q.author_link= quote.css("a[href^='/author']")[0]['href']
                quotes<<q
             end 
		 quotes
	    end


	    def self.phrase_to_search_string(phrase)
		words=phrase.split(' ')
		str=words.join('+')
        search_string="https://www.goodreads.com/quotes/search?commit=Search&page=#{curr_pg}&q=#{str}"
	     end


	



end