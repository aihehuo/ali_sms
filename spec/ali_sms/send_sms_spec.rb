require 'spec_helper'

RSpec.describe AliSms::SendSms do
  describe '#excute' do
    it 'does not print the signed request URL' do
      allow(RestClient).to receive(:get).and_return(:accepted)
      sender = described_class.new('13589898888', 'SMS_TEST', { code: '123456' }.to_json, '爱合伙')

      expect { expect(sender.excute).to eq(:accepted) }.not_to output.to_stdout
    end
  end
end
