require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
  it "should get home" do
    get :home
    expect(response).to have_http_status(:success)
    # expect(tag_list).to have_tag("title", "Home | Ruby on Rails Tutorial Sample App")
  end

  it "should get help" do
    get :help
    expect(response).to have_http_status(:success)
  end

  it "should get about" do
    get :about
    expect(response).to have_http_status(:success)
  end
end
