# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  #Thanks to Steve Heffernan for this
  def action_style(action = nil)
    @action_style = action ||
    @action_style ||
    { "create" => "new", "update" => "new",
    "edit" => "new" }[controller.action_name] ||
    controller.action_name
  end

  def stylesheet_exist?(stylesheet)
    File.exist?(RAILS_ROOT + "/public/stylesheets/" + stylesheet + '.css')
  end

end
