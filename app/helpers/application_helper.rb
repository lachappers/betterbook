module ApplicationHelper
  # Returns the new record created in notifications table
  def new_notification(user, notifiable_id, notifiable_type)
    notice = user.notifications.build(notifiable_id: notifiable_id, notice_type: notifiable_type)
    user.notice_seen = false
    user.save
    notice
  end
  
  # Receives the notification object as parameter along with a type and returns a User record, Post record or a Comment record depending on the type supplied 
  
  def notification_find(notice, type)
    return User.find(notice.notice_id) if type == 'friendRequest'
    return Post.find(notice.notice_id) if type == 'comment'
    return Post.find(notice.notice_id) if type == 'like-post'
    return unless type == 'like-comment'
    comment = Comment.find(notice.notice_id)
    Post.find(comment.post_id)
  end



    def profile_image(user, options={})
        size = case options[:size]
        when "large"
            "w-20 h-20"
        when "small"
            "w-10 h-10"
        else
            "w-14 h-14"
        end

        classes = "#{size} flex-shrink-0 rounded-full border-2 border-white"

        if user.profile_image.attached?
            image_tag user.profile_image, class: classes
        else
            image_tag "https://doodleipsum.com/700/avatar-5?bg=3D27F6&i=f339578a64040310d3eb5bd82b550627", class: classes
        end
    end

end
