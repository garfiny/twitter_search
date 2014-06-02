require 'spec_helper'

describe Services::Progressable do

  let(:total) { 100 }

  describe '#init' do
    it 'only takes positive number' do
      expect { subject.init(-1) }.to raise_error
    end
    it 'only takes number greater than zero' do
      expect { subject.init(0) }.to raise_error
    end
  end

  describe '#total' do
    it 'returns initialized total number' do
      subject.init(total)
      expect(subject.total).to eq(total)
    end
  end

  describe '#report' do
    context 'when mark done with errors' do
      it 'returns error message array' do
        subject.init(total)
        subject.mark_done_with_errors("errors")
        expect(subject.report).to be_kind_of(Array)
        expect(subject.report.sample).to be_kind_of(String)
      end
    end

    context 'when progressing normally' do
      context 'when there is no block given' do
        it 'returns progress percentage' do
          subject.init(total)
          subject.instance_variable_set(:@progressing, 1)
          expect(subject.report).to eq(1 / total.to_f)
        end
      end

      context 'when there is block given' do
        it 'calls block and passing the progress percentage' do
          subject.init(total)
          subject.instance_variable_set(:@progressing, 1)
          block_called = false
          subject.report { |k| block_called = true }
          expect(block_called).to be_true
        end
      end
    end
  end

  describe '#make_progress' do
    it 'increases progress percentage' do
      subject.init(total)
      subject.make_progress
      expect(subject.report).not_to eq(0.0)
    end

    it 'returns percentage' do
      subject.init(total)
      expect(subject.make_progress).to eq(1 / total.to_f)
    end

    context 'block given when initialize the object' do
      let(:item) { "item" }
      it 'calls the block' do
        p = Proc.new { p "====" }
        progress = Services::Progressable.new(&p)
        progress.init(100)
        p.should_receive(:call).with(item)
        progress.make_progress(item)
      end
    end
  end

  describe '#in_progressing?' do
    context 'when not marked done with errors' do
      it 'returns false when total numer greater than progressed number' do
        subject.init(total)
        total.times { subject.make_progress }
        expect(subject.in_progressing?).to eq(false)
      end

      it 'returns true when total numer less than progressed number' do
        subject.init(total)
        (total - 1).times { subject.make_progress }
        expect(subject.in_progressing?).to eq(true)
      end
    end
    context 'when marked done with errors' do
      it 'returns false' do
        subject.init(total)
        (total - 1).times { subject.make_progress }
        subject.mark_done_with_errors("error")
        expect(subject.in_progressing?).to eq(false)
      end
    end
  end

  describe '#mark_done_with_errors' do
    it 'append error messages' do
      subject.init(100)
      subject.mark_done_with_errors("a")
      subject.mark_done_with_errors("a")
      expect(subject.report).to be_kind_of(Array)
      expect(subject.report.size).to be > 1
    end
  end
end
