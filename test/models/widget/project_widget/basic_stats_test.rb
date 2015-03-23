require 'test_helper'

class BasicStatsTest < ActiveSupport::TestCase
  let(:project) { create(:project) }
  let(:widget) { ProjectWidget::BasicStats.new(project_id: project.id) }

  describe 'height' do
    it 'should return 225' do
      widget.height.must_equal 225
    end
  end

  describe 'width' do
    it 'should return 350' do
      widget.width.must_equal 350
    end
  end

  describe 'title' do
    it 'should return the title' do
      widget.title.must_equal I18n.t('project_widgets.basic_stats.title')
    end
  end

  describe 'position' do
    it 'should return 3' do
      widget.position.must_equal 3
    end
  end
end
