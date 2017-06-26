require 'rails_helper'

describe ApplicationHelper do
  describe '#flash_class' do
    it 'test helper' do
      expect(helper.flash_class(:alert)).to eq('alert alert-danger')
    end
  end
end
