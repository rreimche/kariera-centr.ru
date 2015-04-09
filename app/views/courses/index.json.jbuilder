json.array!(@courses) do |course|
  json.extract! course, :id, :title, :short_descr, :full_descr, :start_date, :full_price, :timegroup
  json.url course_url(course, format: :json)
end
