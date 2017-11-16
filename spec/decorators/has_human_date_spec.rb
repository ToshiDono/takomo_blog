require 'spec_helper'

describe 'HasHumanDate' do
  subject { klass.new }
  let(:klass) do
    Class.new do
      include HasHumanDate

      def created_at
        @created_at ||= Time.now
      end
    end
  end

  describe '#human_date_on' do
    it 'human_date_on should return date on format "year-month-day, hour:minutes"' do
      expect(subject.human_date_on(:created_at)).to eq subject.created_at.strftime('%Y-%m-%d, %H:%M')
    end
  end

  describe '#human_date_created_at' do
    it 'human_date_created_at should return date on format "day-month-year"' do
      expect(subject.human_date_created_at).to eq subject.created_at.strftime('%Y-%m-%d')
    end
  end
end
