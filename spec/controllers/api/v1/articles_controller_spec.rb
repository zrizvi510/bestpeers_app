require 'rails_helper'
RSpec.describe Api::V1::ArticlesController, type: :request do
  
  
   before do
     @user = User.create!(username: "tset1", email: "test1@gmail.com", password: "123456", type: "Admin", authentication_token: "tes123456", confirmed_at: Date.today, unconfirmed_email: nil)
   end

    
  

  describe "GET #index" do
    before do
      # byebug
      Article.create(title: "Java blog", body: "This is java blog", like: 3)
      get "/api/v1/articles",headers: {'token': @user.authentication_token }  
    end

    let(:response_keys) {
      ["id","title","body","like","created_at","updated_at"]
    }

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "JSON body response contains expected article attributes" do
      # expect(JSON.parse(response.body).count).to eq(1)
      expect(JSON.parse(response.body).first["title"]).to eq("Java blog")
      expect(JSON.parse(response.body).first.keys).to eq(response_keys)
    end
  end


describe 'DELETE /article' do
  it 'will delete a article' do
    article = Article.create(title: "Java blog", body: "This is java blog", like: 3)
    delete "/api/v1/articles/#{article.id}", headers: {'token': @user.authentication_token }
    expect(response.status).to eq(200)
  end
end


  describe 'Get /article' do
    it 'will return a article' do
      article = Article.create(title: "Java blog", body: "This is java blog", like: 3)
      get "/api/v1/articles/#{article.id}", headers: {'token': @user.authentication_token }
      expect(response.status).to eq(200)
    end
  end



  describe 'POST /articles' do
    scenario 'valid article attributes' do
      # byebug
      post "/api/v1/articles", params: {
        article: {
        title: 'Ruby blog'
        }
      },headers: {'token': @user.authentication_token }
      
      expect(response.status).to eq(200)
      json = JSON.parse(response.body).deep_symbolize_keys
      expect(json[:title]).to eq('Ruby blog')
    end

    # scenario 'invalid article attributes' do
    #   post "/api/v1/articles", params: {
    #     article: {
    #     title: ''
    #     }
    #   }

    #   expect(response.status).to eq(200)
    #   json = JSON.parse(response.body).deep_symbolize_keys
    #   expect(json[:title]).to eq("can't blank")
    # end
  end
  
  describe 'PUT /articles' do
    let!(:article) { Article.create(title: "Paython", body: "This is Paython", like: 3) }
    scenario 'valid article attributes' do
      put "/api/v1/articles/#{article.id}", params: {
        article: {
          title: 'Paython'
        }
      },headers: {'token': @user.authentication_token }

      expect(response.status).to eq(200)
      json = JSON.parse(response.body).deep_symbolize_keys
      expect(json[:title]).to eq('Paython')   
    end

  # scenario 'invalid article attributes' do
  #   put "/api/v1/articles/#{article.id}", params: {
  #     article: {
  #       title: ''
  #     }
  #   }

  #   expect(response.status).to eq(400)
  #   json = JSON.parse(response.body).deep_symbolize_keys
  #   expect(json[:title]).to eq("can't blank")
  # end
end




end