require 'rails_helper'

describe ServiceProviderUpdater do
  describe '#ping' do
    xit 'returns true for success' do
      expect(ServiceProviderUpdater.ping).to eq true
    end
  end
end
