require 'spec_helper'

describe PostsController do

  describe "GET index" do
    it "should be successful" do
      get :index
      response.should be_success
    end
  end

  describe "GET new" do
    it "should be successful" do
      get :new
      response.should be_success
    end

    it "assigns @post" do
      get :new
      assigns[:post].should_not be_nil
    end

    it "should create an unsaved Post" do
      get :new
      assigns[:post].should_not be_persisted
    end
  end

  describe "POST create" do
    before do
      let(:recipe) { mock_model(Post).as_null_object }
      @attr = { 'title' => "Title",
                'body'  => "A new post." }
    end

    it "creates a new recipe" do
      Recipe.should_receive(:new).with(@attr).and_return(recipe)
      post :create, post: @attr
    end
  end
end
