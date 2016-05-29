require 'rails_helper'

 RSpec.describe Api::V1::PostsController, type: :controller do
   let(:my_user) { create(:user) }
   let(:my_topic) { create(:topic) }
   let(:my_post) { create(:post, title: "Post Title", body: "There once was a frog who lived in a bog and he played the bass fiddle in the middle of a puddle.") }

  context "unauthenticated user" do
    it "PUT update returns http unauthenticated" do
      put :update, id: my_post.id, post: {title: "Post Title", body: "There once was a frog who lived in a bog and he played the bass fiddle in the middle of a puddle.", topic: my_topic, user: my_user }
      expect(response).to have_http_status(401)
    end

    it "POST create returns http unauthenticated" do
      post :create, post: {title: "Post Title", body: "There once was a frog who lived in a bog and he played the bass fiddle in the middle of a puddle.", topic: my_topic, user: my_user }
      expect(response).to have_http_status(401)
    end

    it "DELETE destroy returns http unauthenticated" do
      delete :destroy, id: my_post.id
      expect(response).to have_http_status(401)
    end
  end

  context "unauthorized user" do
    it "PUT update returns http forbidden" do
      put :update, id: my_post.id, post: {title: "Post Title", body: "There once was a frog who lived in a bog and he played the bass fiddle in the middle of a puddle.", topic: my_topic, user: my_user }
      expect(response).to have_http_status(403)
    end

    it "POST create returns http forbidden" do
      post :create, post: {title: "Post Title", body: "There once was a frog who lived in a bog and he played the bass fiddle in the middle of a puddle.", topic: my_topic, user: my_user }
      expect(response).to have_http_status(403)
    end

    it "DELETE destroy returns http forbidden" do
      delete :destroy, id: my_post.id
      expect(response).to have_http_status(403)
    end

  end

 end
