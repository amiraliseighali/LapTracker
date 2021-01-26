module ApplicationHelper

    def user_avatar(user, size=40)
        
        if user.avatar.attached?
            user.avatar.variant(resize: "#{size}x#{size}!")
        else
            gravatar_image_url('aseighali96@gmail.com'.gsub('spam', 'mdeering'),size: size )
        end
    end
end
