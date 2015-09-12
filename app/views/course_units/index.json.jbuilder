json.array!(@course_units) do |course_unit|
  json.extract! course_unit, :id, :title, :description, :note
  json.url course_unit_url(course_unit, format: :json)
end
