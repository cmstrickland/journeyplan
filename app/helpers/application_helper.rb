module ApplicationHelper

  def needs_negotiators?
    Negotiator.count > 0
  end
end
