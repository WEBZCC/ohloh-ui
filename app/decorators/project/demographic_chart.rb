class Project::DemographicChart
  SORT_ORDER = ['Inactive', 'Very Low', 'Low', 'Moderate', 'High', 'Very High', 'New']
  INACTIVE_INDEX = 20

  class << self
    def data
      default_options = DEMOGRAPHIC_CHART_DEFAULTS.deep_dup
      default_options['plotOptions']['pie']['startAngle'] = angle
      default_options['series'] << { 'data' => activity_level_data }
      default_options
    end

    private

    def activity_level_data
      count_by_activity_level.each_with_object([]) do |(level, count), array|
        array.push Project::ActivityLevelIndex.new(level, count, total_count).demographic_chart_data
      end.sort_by { |d| SORT_ORDER.index(d[:name]) }
    end

    def count_by_activity_level
      Project.group(:activity_level_index).with_pai_available
    end

    def total_count
      @count ||= count_by_activity_level.values.sum
    end

    def angle
      90.0 - 360 * (count_by_activity_level[INACTIVE_INDEX].to_f / total_count) / 2
    end
  end
end
