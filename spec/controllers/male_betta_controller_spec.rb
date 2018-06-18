require 'rails_helper'

describe MaleBettaController, type: :controller do

  let(:admin) {FactoryBot.create(:admin)}
  let(:male_bettum) {FactoryBot.create(:male_bettum)}

  context 'GET /male_betta' do
    it 'show the bettas page' do
      get :index
      expect(response).to be_ok
      expect(response).to render_template('index')
    end
  end

  context 'GET #show' do
    it 'shows the betta' do
      get :show, params: {id: male_bettum.id}
      expect(response).to be_ok
      expect(response).to render_template('show')
    end
  end

  describe 'POST #create' do
    context "the admin can" do

      before do
        sign_in admin
      end

      it "restock the bettas" do
        expect{
          post :create, params: { male_bettum: FactoryBot.attributes_for(:male_bettum) }
        }.to change(MaleBettum,:count).by(1)
      end

    end


    context "damaged bettas" do

      before do
        sign_in admin
      end

      it "cannot be restocked" do
        expect{
          post :create, params: { male_bettum: FactoryBot.attributes_for(:male_bettum, name: nil) }
        }.to change(MaleBettum,:count).by(0)
      end
    end
  end

  context 'PATCH #update' do
    before do
      sign_in admin
      @update = {id: male_bettum.id, color: "salt & pepper"}
    end

    it "successfully updates the betta" do
      patch :update, params: { id: male_bettum.id, male_bettum: @update}
      male_bettum.reload
      expect(male_bettum.color).to eq "salt & pepper"
    end
  end

  context 'DELETE #destroy' do

    before do
      sign_in admin
    end

    it "admin can delete a product" do
      delete :destroy, params: {id: male_bettum.id}
      expect(response).to redirect_to male_betta_path
    end

  end
end
