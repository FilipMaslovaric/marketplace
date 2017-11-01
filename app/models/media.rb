class Media < ApplicationRecord
	mount_uploader :file_name, MediaUploader
end
