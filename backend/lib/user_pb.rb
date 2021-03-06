# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: user.proto

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("user.proto", :syntax => :proto3) do
    add_message "user.UserId" do
      optional :uid, :string, 1
    end
    add_message "user.UserToken" do
      optional :token, :string, 1
    end
    add_message "user.User" do
      optional :uid, :string, 1
      optional :gender, :int32, 2
      optional :firstName, :string, 3
      optional :lastName, :string, 4
      optional :nickName, :string, 5
      optional :email, :string, 6
      optional :birthDate, :string, 7
      optional :streetAddress, :string, 8
      optional :zipCode, :string, 9
      optional :city, :string, 10
      optional :phone, :string, 11
      optional :image, :string, 12
      optional :isActive, :bool, 13
    end
  end
end

module User
  UserId = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("user.UserId").msgclass
  UserToken = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("user.UserToken").msgclass
  User = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("user.User").msgclass
end
