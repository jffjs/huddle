class Comment
  include Mongoid::Document
  recursively_embeds_many
  field :body, type: String
  embedded_in :post
end
