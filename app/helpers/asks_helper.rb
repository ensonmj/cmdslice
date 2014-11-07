module AsksHelper
  def select_ask_icons_by_user(user, ask)
    content_tag(:div, class: "pull-right") do
      if ((controller_name == "asks" && action_name == "index") \
          || (controller_name == "users" && action_name == "show"))
        concat content_tag(:a,
          content_tag(:span, nil, class: "glyphicon glyphicon-comment"),
          href: ask_path(ask))
      end
      unless user.nil?
        if ask.user?(user)
          concat content_tag(:a,
            content_tag(:span, nil, class: "glyphicon glyphicon-edit"),
            href: edit_user_ask_path(user, ask))
          concat content_tag(:a,
            content_tag(:span, nil, class: "glyphicon glyphicon-trash"),
            href: ask_path(ask),
            method: :delete, data: {confirm: "Are you sure?"})
        else
          concat content_tag(:span, nil, class: "glyphicon glyphicon-thumbs-up")
          concat content_tag(:span, nil, class: "glyphicon glyphicon-thumbs-down")
          concat content_tag(:span, nil, class: "glyphicon glyphicon-heart",
                            title: "Add to your favorites", data: {
                              toggle: "tooltip", placement: "top"
                            })
        end
      end
    end
  end
end
