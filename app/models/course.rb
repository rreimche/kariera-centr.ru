class Course < ActiveRecord::Base
	enum timegroup: {morning: 0, day: 1, evening: 2}
	has_attached_file :featured_image, styles: {homepage: "369x176>"}, default_url: "/images/:style/missing.png"
	has_many :feedbacks
	#validates_content_type :featured_image, content_type: /\Aimage\/.*\Z/
	#validates_presence :true
	#validates :short_descr, length: { maximum: 144 }
	#validates :advance_payment, presence: :true
	#validates :monthly_payment, presence: :true
	validates :full_price, presence: true
	validates_inclusion_of :published, :in => [true, false]
	validates_attachment :featured_image, presence: true, 
		content_type: { content_type: /\Aimage\/.*\Z/ },
		size: { in: 0..3.megabytes }
	(0...ENV['COURSE_PANELS_QTY'].to_i).each do |i|
		validates "panel#{i}_title".to_sym, length: { maximum: 255 }
	end
	(0...ENV['COURSE_CURRICULUMPARTS_QTY'].to_i).each do |i|
  		validates "curriculum#{i}_title".to_sym, length: { maximum: 255 }
  	end
end
