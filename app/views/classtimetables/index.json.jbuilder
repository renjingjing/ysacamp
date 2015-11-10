json.array!(@classtimetables) do |classtimetable|
  json.extract! classtimetable, :id, :start_time, :day, :weekday, :month, :year
  json.url classtimetable_url(classtimetable, format: :json)
end
