class TabPresenter
	require 'active_support/inflector'
	# require 'pry'
	def self.for
		:tab
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
		# binding.pry
		index = @attributes[:for].str
		index.downcase!
		index = ActiveSupport::Inflector.transliterate(index)

		@attributes[:for] = index
		@attributes # i'm not sure if I need this here...
	end

end