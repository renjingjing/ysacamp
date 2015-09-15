module ApplicationHelper
  def formatted_date(date)
    date.strftime("%Y-%b-%d %A") unless date==nil
  end

  def formatted_time(time)
    time.strftime("%H:%M")
  end
end
