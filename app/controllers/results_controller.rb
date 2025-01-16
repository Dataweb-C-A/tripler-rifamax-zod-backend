class ResultsController < ApplicationController
  def index
    results = Result.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
    serialized_results = ActiveModelSerializers::SerializableResource.new(results, each_serializer: ResultSerializer).as_json

    grouped_results = group_results(serialized_results)

    render json: {
      filter_by: 'Daily',
      current_date: Time.now.strftime('%d/%m/%Y'),
      current_time: Time.now.strftime('%I:%M %p'),
      results: [grouped_results]
    }, status: :ok
  end

  def yesterday
    results = Result.where(created_at: Time.zone.yesterday.beginning_of_day..Time.zone.yesterday.end_of_day)
    serialized_results = ActiveModelSerializers::SerializableResource.new(results, each_serializer: ResultSerializer).as_json

    grouped_results = group_results(serialized_results)

    render json: {
      filter_by: 'Daily',
      current_date: Time.now.strftime('%d/%m/%Y'),
      current_time: Time.now.strftime('%I:%M %p'),
      results: [grouped_results]
    }, status: :ok
  end

  def weekly
    results = Result.where(created_at: (Time.zone.now - 7.days).beginning_of_day..Time.zone.now.end_of_day)
    serialized_results = ActiveModel::SerializableResource.new(results, each_serializer: ResultSerializer).as_json

    render json: {
      filter_by: 'Weekly',
      current_date: Time.now.strftime('%d/%m/%Y'),
      current_time: Time.now.strftime('%I:%M %p'),
      results: serialized_results
    }, status: :ok
  end

  private

  def group_results(results)
    grouped = {
      triple_a: [],
      triple_b: [],
      triple_c: [],
      zodiacal: [],
      rifamax: []
    }

    grouped_data = results.group_by do |result|
      case result[:draw]
      when /Triple Rifamax Zodiacal A/
        :triple_a
      when /Triple Rifamax Zodiacal B/
        :triple_b
      when /Triple Rifamax Zodiacal C/
        :triple_c
      when /Zodiacal/
        :zodiacal
      when /Rifamax/
        :rifamax
      else
        nil
      end
    end

    grouped.merge(grouped_data.transform_values { |group| group })
  end
end
