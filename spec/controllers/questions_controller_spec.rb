require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do

  describe "POST #create" do
  
    context "with valid attributes" do
    let(:user) { create(:user)}

      before do
        sign_in(user)
      end
      it "create new question" do
        post :create, { params: { question: attributes_for(:question) } }
        
        expect(Question.count).to eq(1)
        expect(response).to have_http_status(302)
      end
    end
  end
end