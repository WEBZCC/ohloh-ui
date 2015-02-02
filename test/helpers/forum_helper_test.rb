require 'test_helper'

class ForumHelperTest < ActionView::TestCase
  include ForumHelper

  before do
    Object.any_instance.stubs(:current_user_is_admin?).returns(:true)
  end

  let(:forum) { forums(:rails) }
  let(:admin) { accounts(:rails) }
  let(:admin_sidebar) do
    [
      [
        [nil, 'Posts'],
        [:recent, 'Recent Posts', '/posts'],
        [:need_answers, 'Unanswered Posts', '/posts?unanswered=true']
      ],
      [
        [nil, 'Admin'],
        [:new, 'New Forum', '/forums/new']
      ]
    ]
  end

  let(:forum_sidebar) do
    [
      [
        [nil, 'Topics'],
        [:new_topic, 'New Topic', '/forums/1/topics/new'],
        [:forum, 'rails', '/forums/1']
      ],
      [
        [nil, 'Posts'],
        [:recent, 'Recent Posts', '/posts'],
        [:need_answers, 'Unanswered Posts', '/posts?unanswered=true']
      ]
    ]
  end

  it 'should return two sections' do
    @forum = forum
    forums_sidebar.length.must_equal 2
  end

  it 'should return three sections' do
    forums_sidebar.length.must_equal 2
  end

  it 'should return forum menu list' do
    @forum = forum
    forums_sidebar.must_equal forum_sidebar
  end

  it 'should return admin forum menu list' do
    forums_sidebar.must_equal admin_sidebar
  end
end
