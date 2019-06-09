class UserSerializer < ActiveModel::Serializer
    include Rails.application.routes.url_helpers
    
    attributes :id, :username, :email, :role, :created_at, :updated_at, :picture

    #has_many :tokens

    def picture
        url_for(object.avatar) if object.avatar.attached?
    end
end