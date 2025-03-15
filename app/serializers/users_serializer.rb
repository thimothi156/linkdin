class UsersSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id :email
end
