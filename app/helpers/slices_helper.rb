module SlicesHelper
  def select_icons_by_user(user, slice)
    content_tag(:div, class: "pull-right") do
      concat content_tag(:span, nil, class: "glyphicon glyphicon-comment")
      unless user.nil?
        if slice.user?(user)
          concat content_tag(:span, nil, class: "glyphicon glyphicon-edit")
          concat content_tag(:span, nil, class: "glyphicon glyphicon-trash")
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
