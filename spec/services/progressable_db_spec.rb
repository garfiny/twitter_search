require 'spec_helper'

describe Services::ProgressableDb do

  let(:total) { 100 }

  describe '#init' do
    it 'create new progress record' do
      subject.init(total)
      expect(Progress.count).to eq(1)
    end
  end

  describe '#make_progress' do
    it 'update progress record' do
      subject.init(total)
      subject.make_progress
      expect(Progress.last.progress).to eq(subject.percentage)
    end
  end

  describe '#mark_done_with_errors' do
    let(:err_msg) { "error" }
    it 'update progress record with errors' do
      subject.init(100)
      subject.mark_done_with_errors(err_msg)
      expect(Progress.last.report).to eq(err_msg)
      expect(Progress.last.status).to eq("failed")
    end
  end
end
