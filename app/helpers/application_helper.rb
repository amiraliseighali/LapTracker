module ApplicationHelper
include Pagy::Frontend

    def user_photo(photoType)
        if photoType.attached?
            photoType
        else
            gravatar_image_url('aseighali96@gmail.com'.gsub('spam', 'mdeering'),size: size )
        end
    end

end
