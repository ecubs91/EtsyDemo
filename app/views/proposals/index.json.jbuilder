json.array!(@proposals) do |proposal|
  json.extract! proposal, :id, :tutor_id, :tutorial_request_id, :message, :success
  json.url proposal_url(proposal, format: :json)
end
