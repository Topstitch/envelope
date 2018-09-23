module ApplicationHelper
  def format_date(date)
    date.strftime('%Y-%m-%d') if date
  end

  def alert_icon
    fa_icon 'exclamation-circle'
  end

  def verified_icon
    fa_icon 'check-square-o'
  end
end
