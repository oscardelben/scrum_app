module ApplicationHelper

  def alert_css_class name
    case name
    when 'notice'
      'alert-success'
    when 'error'
      'alert-error'
    end
  end

end
