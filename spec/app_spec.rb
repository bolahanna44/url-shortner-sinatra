# frozen_string_literal: true

require_relative './spec_helper'

def app
  App
end

describe App do
  describe 'create short url' do
    it 'should return json with short url, original url and id as keys' do
      post '/urls', attributes_for(:url)
      response = JSON.parse(last_response.body)
      expect(response.keys).to match(%w[id original_url short_url])
    end

    it 'should return json with short url not being blank' do
      post '/urls', attributes_for(:url)
      response = JSON.parse(last_response.body)
      expect(response['short_url']).not_to be_blank
    end
  end

  describe 'redirect to original url' do
    it 'should redirect to original url' do
      url = create(:url)
      get "/#{url.short_url}"
      expect(last_response).to be_redirect
      follow_redirect!
      expect(last_request.url).to match(url.original_url)
    end

    it 'should respond with status not found' do
      get '/test'
      expect(last_response).to be_not_found
    end
  end
end
