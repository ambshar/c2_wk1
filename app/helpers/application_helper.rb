module ApplicationHelper
  def fix_url(str)
    str.starts_with?('http://') ? str : "http://#{str}"

  end

  def display_datetime(dt)
    if logged_in? && !current_user.time_zone.blank?
      dt = dt.in_time_zone(current_user.time_zone)
    end
    dt.strftime("%l:%M %P on %b %e %Y %Z")
  end

  def has_voted(obj)
    
    
    v = Vote.where(user_id: current_user.id, voteable: obj, voteable_id: obj.id)

    !v.empty?
    
  end
end
