class TabbedPresenter

	def self.for
		[:tabbed, :pilled]
	end

	def initialize(attributes, content, additional_attributes)
	    @content = content
	    @attributes = attributes
	end

	def content
		@content
	end

	def attributes
		#prepare indexes of tabs
		tabs = @attributes[:tabs].str
		tabs.downcase!
		tabs = Translit.convert(tabs, :english)
		tabs = tabs.split(',')
		tabs.map! { |tab| tab.parameterize }

		#prepare titles of tabs
		titles = @attributes[:tabs].str
		titles = titles.split(',') 

		@attributes[:tabs] = tabs
		@attributes[:titles] = titles
		@attributes # i'm not sure if I need this here...
	end

end