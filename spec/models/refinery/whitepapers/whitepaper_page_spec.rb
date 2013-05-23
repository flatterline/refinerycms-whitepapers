require 'spec_helper'

module Refinery
  describe WhitepaperPage do

    before do
      @whitepaper_page = FactoryGirl.build :whitepaper_page
    end

    it 'can be created' do
      expect(@whitepaper_page.save).to be_true
    end

  end
end
