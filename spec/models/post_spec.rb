require 'spec_helper'

describe Post do
  describe "#recursive_find_comment" do

    before(:all) do
      @post = Post.create(title: "Title", body: "Body text")
      @root_comment = Comment.new(body: "root comment")
      @nested_1_comment = Comment.new(body: "nested 1 comment")
      @nested_2_comment = Comment.new(body: "nested 2 comment")
      @nested_3_comment = Comment.new(body: "nested 3 comment")

      @nested_2_comment.child_comments << @nested_3_comment
      @nested_1_comment.child_comments << @nested_2_comment
      @root_comment.child_comments << @nested_1_comment
      @post.comments << @root_comment
    end

    it "should find a comment at the root level post comments" do
      comment = @post.recursive_find_comment(@root_comment.id)
      comment.should == @root_comment
    end

    it "should find a comment nested one level deep" do
      comment = @post.recursive_find_comment(@nested_1_comment.id)
      comment.should == @nested_1_comment
    end

    it "should find a comment nested two levels deep" do
      comment = @post.recursive_find_comment(@nested_2_comment.id)
      comment.should == @nested_2_comment
    end

    it "should find a comment nested three levels deeps" do
      comment = @post.recursive_find_comment(@nested_3_comment.id)
      comment.should == @nested_3_comment
    end
  end
end
