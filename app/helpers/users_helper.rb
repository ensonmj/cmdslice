module UsersHelper
  def user_got_comments(user)
    if user.nil?
      0
    else
      total = 0
      user.slices.each do |slice|
        total += slice.comments.count
      end
      total
    end
  end
end
