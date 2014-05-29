require 'spec_helper'

describe Services::UsernameGenerator do
  describe '#generate' do
    let(:usernames) { subject.generate }
    let(:limit) { APP_CONFIG[:usernames_gen_limits] }

    it 'randomly generate usernames' do
      expect(subject.generate).to be_kind_of(Array)
    end

    it 'randomly generate configured size of names' do
      expect(subject.generate.size).to eq(limit)
    end
  end
end
