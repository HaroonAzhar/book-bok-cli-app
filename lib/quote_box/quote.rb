
class Quote
	attr_accessor :content,:likes,:scripture_it_belongs_to,:author, :author_link,:author_name
	 
    @@curr_pg=1
    
	def initialize(cont,likes,book,author_name,author=nil)
		@content=cont
		@likes=likes
		@author_name=author_name
		@scripture_it_belongs_to=book
		@author=author

	end

	def display
		puts "\n#{self.content}"
		puts "\n-#{self.author_name}#{self.scripture_it_belongs_to }"
		puts "\nIt has #{self.likes}"
	end
	
	
end