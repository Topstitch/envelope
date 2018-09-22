module ApplicationHelper
  def format_date(date)
    date.strftime('%Y-%m-%d')
  end

  def alert_icon
    fa_icon 'exclamation-circle'
  end
end
