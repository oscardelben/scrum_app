module StoriesHelper
  def state_select_options
    Story::STATES.map {|state| [state.to_s.titleize, state] }
  end
end
