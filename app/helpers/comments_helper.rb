module CommentsHelper
  def select_comment_icons_by_user(user, slice, comment)
    content_tag(:div, class: "pull-right") do
      if user
        if comment.user?(user)
          concat content_tag(:a,
            content_tag(:span, nil, class: "glyphicon glyphicon-trash"),
            href: slice_comment_path(slice, comment),
            method: :delete, data: {confirm: "Are you sure?"})
        else
          concat content_tag(:a,
            content_tag(:span, nil, class: "fa fa-reply"),
            href: "javascript:void(0);")
        end
      end
    end
  end
end
