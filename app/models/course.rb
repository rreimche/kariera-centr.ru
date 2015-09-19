class Course < ActiveRecord::Base
	enum timegroup: {morning: 0, day: 1, evening: 2}
	has_attached_file :featured_image, styles: {homepage: "369x176>"}, default_url: "/images/:style/missing.png"
	has_many :feedbacks
	#validates_content_type :featured_image, content_type: /\Aimage\/.*\Z/
	#validates_presence :true
	#validates :short_descr, length: { maximum: 144 }
	validates :advance_payment, presence: :true
	validates :monthly_payment, presence: :true
	validates_attachment :featured_image, presence: true, 
		content_type: { content_type: /\Aimage\/.*\Z/ },
		size: { in: 0..3.megabytes }
end
