module ApplicationHelper
include Pagy::Frontend

    def user_avatar(user)
        if user.avatar.attached?
            user.avatar
        else
            gravatar_image_url('aseighali96@gmail.com'.gsub('spam', 'mdeering'),size: size )
        end
    end

end
