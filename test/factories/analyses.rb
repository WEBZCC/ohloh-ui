FactoryGirl.define do
  factory :analysis do
    association :project
    association :main_language, factory: :language
    markup_total 100
    logic_total 101
    build_total 102
    first_commit_time { Time.now - 1.year }
    min_month { Date.today - 1.month }
    max_month { Date.today - 1.day }
    last_commit_time { Time.now - 1.day }
    after(:create) do |instance|
      instance.update_attributes(thirty_day_summary: create(:thirty_day_summary, analysis: instance))
      instance.update_attributes(twelve_month_summary: create(:twelve_month_summary, analysis: instance))
      prev = create(:previous_twelve_month_summary, analysis: instance)
      instance.update_attributes(previous_twelve_month_summary: prev)
      instance.update_attributes(all_time_summary: create(:all_time_summary, analysis: instance))
    end
  end
end
