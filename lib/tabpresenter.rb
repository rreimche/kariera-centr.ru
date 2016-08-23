class TabPresenter
	def self.for
		[:tab, :pill]
	end

	def initialize(attributes, content, additional_attributes)
	    @content = content
	    @attributes = attributes
	end

	def content
		@content
	end

	def attributes
		#prepare indexes for content panes
		index = @attributes[:for].str
		index.downcase!
		index = Translit.convert(index, :english)
		index = index.parameterize

		@attributes[:for] = index
		@attributes # i'm not sure if I need this here...
	end

end