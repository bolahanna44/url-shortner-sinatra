require_relative '../spec_helper'

describe Url do
  describe 'validations' do
    it 'should not be valid if no link is provided' do
      expect(build(:url, original_url: nil)).not_to be_valid
    end

    it 'should not be valid if provided link not valid link' do
      expect(build(:url, original_url: 'test string')).not_to be_valid
    end

    it 'should not be valid if provided link is empty string' do
      expect(build(:url, original_url: '')).not_to be_valid
    end

    it 'should be valid if link is provided' do
      expect(build(:url)).to be_valid
    end
  end

  describe 'callbacks' do
    it 'should generate short link after creation' do
      link = create(:url)
      expect(link.short_url).not_to be_blank
    end
  end
end
