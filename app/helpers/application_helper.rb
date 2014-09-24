module ApplicationHelper
  def sprite_tag(klass, options={})
    image_tag('s.gif', {:class => klass, :alt => klass}.merge(options))
  end

  def bootstrap_class_for flash_type
    {success: "alert-success",
     error: "alert-danger",
     alert:  "alert-warning",
     notice: "alert-info"}[flash_type.to_sym] || flash_type.to_s
  end
end
