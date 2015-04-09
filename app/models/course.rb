class Course < ActiveRecord::Base
	enum timegroup: {morning: 0, day: 1, evening: 2}
end
