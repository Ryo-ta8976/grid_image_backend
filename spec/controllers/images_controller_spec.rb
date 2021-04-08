require 'rails_helper'

RSpec.describe ImagesController, type: :controller do
    describe 'GET #index' do
        before do
            FactoryGirl.create_list(:image, 10)
            get :index
        end
        it 'レスポンスコードが200であること' do
            expect(response).to have_http_status(:ok)
        end
        it '正しい数のデータが返されること' do
            json = JSON.parse(response.body)
            expect(json.length).to eq(10)
        end
    end

    describe 'POST #create' do
        context '正しい情報が渡ってきた時' do
            it 'iamgeが一つ増えていること' do
                expect { post :create, params: { params: { label: 'label', url: 'url' }} }.to change(Image, :count).by(+1)
            end
        end
    end

    describe 'POST #delete' do
        context '正しい情報が渡ってきた時' do
            before :each do
                @post = FactoryGirl.create(:image)
            end
            it 'imageがひとつ減ること' do
                expect { delete :destroy, id: @post.id }.to change(Image, :count).by(-1)
            end
        end
    end

    describe 'GET #search' do
        context 'DB内にあるlabelが渡ってきた時' do
            before do
                @post = FactoryGirl.create(:image)
            end
            it 'マッチしたimageをひとつ返す' do
                get :search, params: { label: @post.label }
                json = JSON.parse(response.body)
                expect(json.length).to eq(1)
            end
        end
        context 'DB内にないlabelが渡ってきた時' do
            it 'マッチしたimageは0個' do
                get :search, params: { label: 'sample' }
                json = JSON.parse(response.body)
                expect(json.length).to eq(0)
            end
        end
    end
end
