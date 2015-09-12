json.array!(@programs) do |program|
  json.extract! program, :id, :course_name, :level, :class_amount, :time_info, :description, :max_students
  json.url program_url(program, format: :json)
end
