require 'rails_helper'

RSpec.describe Image, type: :model do
    context '正常な情報が渡された場合' do
        it 'labelとurlがある場合、有効' do
            image = Image.new(
                label: "sample",
                url: "sample"
            )
            expect(image).to be_valid
        end
    end
    # context '異常な情報が渡された場合' do
    #     it 'labelがない場合、無効' do
    #         image = Image.new(
    #             label: nil,
    #             url: "sample"
    #         )
    #         image.valid?
    #         expect(image.errors[:label]).to include("can't be blank")
    #     end
    #     it 'urlがない場合、無効' do
    #         image = Image.new(
    #             label: "sample",
    #             url: nil
    #         )
    #         image.valid?
    #         p image.errors[:url]
    #         expect(image.errors[:url]).to include("can't be blank")
    #     end
    # end
end