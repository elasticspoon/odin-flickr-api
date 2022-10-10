# rubocop:disable Metrics/BlockLength
require 'rails_helper'

RSpec.describe FlickrAPI do
  describe 'self.get_user_photos' do
    let(:api) { FlickrAPI }
    let(:flickr) { class_double(Flickr) }
    before do
      allow(api).to receive(:flickr).and_return(flickr)
    end

    context 'when user_id is present' do
      let(:user_id) { true }
      it 'calls photos and search' do
        allow(flickr).to receive_message_chain(:photos, :search).and_return(nil)
        expect(flickr).to receive_message_chain(:photos, :search).with(user_id:)
        api.get_user_photos(user_id)
      end

      it 'returns the value from gem searching api' do
        allow(flickr).to receive_message_chain(:photos, :search).and_return('some value')
        returned_value = api.get_user_photos(user_id)
        expect(returned_value).to eq 'some value'
      end

      it 'it returns user not found if user is not present in api' do
        allow(flickr).to receive_message_chain(:photos, :search).and_raise(NameError)
        expect(api.get_user_photos(user_id)).to eq :user_not_found
      end
    end

    context 'when user_id is nil' do
      let(:user_id) { nil }
      it 'calls nothing' do
        expect(flickr).to_not receive(:photos)
        api.get_user_photos(user_id)
      end
      it { expect(api.get_user_photos(user_id)).to be_nil }
    end
  end
end

# rubocop:enable Metrics/BlockLength
