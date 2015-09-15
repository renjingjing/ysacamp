json.array!(@programs) do |program|
  json.extract! program, :id, :program_name,:description
  json.url program_url(program, format: :json)
end
