# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def formatted_date(date)
    date.strftime('%m/%d/%y')
  end
  
end
