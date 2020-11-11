require 'rails_helper'

describe Beneficiary do
  describe 'associations' do
    let(:beneficiary) { described_class.new }

    it { expect(beneficiary).to belong_to(:shop) }
  end

  describe 'validations' do
    it { should validate_uniqueness_of(:cpf) }
  end
end
