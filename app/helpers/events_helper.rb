module EventsHelper
  def duration_list
    durations = []
    I18n.t('events.durations').each do |duration|
      durations << [duration[1], duration[0]]
    end

    durations
  end
end
