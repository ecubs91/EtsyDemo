json.array!(@disussion_forums) do |disussion_forum|
  json.extract! disussion_forum, :id, :subject, :question, :details
  json.url disussion_forum_url(disussion_forum, format: :json)
end
