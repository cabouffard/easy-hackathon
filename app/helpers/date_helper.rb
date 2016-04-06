module DateHelper
  def format_date(date)
    date.strftime('%a, %d %b %I:%M %P').upcase
  end
end
