module SlicesHelper
  def select_slice_icons_by_user(user, slice)
    content_tag(:div, class: "pull-right") do
      if ((controller_name == "slices" && action_name == "index") \
          || (controller_name == "users" && action_name == "show"))
        concat content_tag(:a,
          content_tag(:span, nil, class: "glyphicon glyphicon-comment"),
          href: slice_path(slice))
      end
      unless user.nil?
        if slice.user?(user)
          concat content_tag(:a,
            content_tag(:span, nil, class: "glyphicon glyphicon-edit"),
            href: edit_slice_path(slice))
          concat content_tag(:a,
            content_tag(:span, nil, class: "glyphicon glyphicon-trash"),
            href: slice_path(slice),
            data: {method: :delete, confirm: "Are you sure?"})
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
