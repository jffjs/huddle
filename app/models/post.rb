class Post
  include Mongoid::Document
  field :title, type: String
  field :body,  type: String
  embeds_many :comments

  def recursive_find_comment(id)
    find_recursively_by_id(self.comments, id)
  end

  private

  def find_recursively_by_id(coll, id)
    item = coll.where(_id: id).first

    unless item
      coll.each do |c|
        item = find_recursively_by_id(c.child_comments, id)
        break if item
      end
    end

    return item
  end
end
