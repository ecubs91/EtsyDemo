json.array!(@tutorial_requests) do |tutorial_request|
  json.extract! tutorial_request, :id, :subject, :level, :duration
  json.url tutorial_request_url(tutorial_request, format: :json)
end
