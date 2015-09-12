json.array!(@course_resources) do |course_resource|
  json.extract! course_resource, :id, :title, :content, :kind_id, :resource_file, :kind_id, :note
  json.url course_resource_url(course_resource, format: :json)
end
