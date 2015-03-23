require 'test_helper'

describe 'StackWidgetsController' do
  let(:stack) { create(:stack) }

  describe 'index' do
    it 'should return stack widgets and stack and its account' do
      get :index, stack_id: stack.id

      must_respond_with :ok
      assigns(:widget).class.must_equal StackWidget
      assigns(:stack).must_equal stack
      assigns(:account).must_equal stack.account
    end
  end

  describe 'normal' do
    it 'should set stack and widget' do
      get :normal, stack_id: stack.id

      must_respond_with :ok
      assigns(:widget).class.must_equal StackWidget
      assigns(:stack).must_equal stack
    end

    it 'should show not found error' do
      get :normal, stack_id: 0

      must_respond_with :ok
      @response.body.must_equal I18n.t('widgets.not_found')
    end

    it 'should render image for gif format' do
      skip('TODO: implement after mini_magick')
      get :normal, stack_id: stack.id, format: :gif

      must_respond_with :ok
      assigns(:widget).class.must_equal StackWidget
      assigns(:stack).must_equal stack
    end
  end
end
