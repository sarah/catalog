Factory.sequence :login do |n|
  "flash#{n}"
end

Factory.sequence :email do |n|
  "cat#{n}@urcoolapp.com"
end

Factory.sequence :title do |n|
  "fabulous entry #{n}"
end

Factory.define :user do |u|
  u.login {  Factory.next(:login) }
  u.password "secret"
  u.password_confirmation "secret"
  u.email { Factory.next(:email) }
end

Factory.define :admin, :parent => :user do |u|
  u.admin true
end

#  This is not right.... maybe for specs but not for
Factory.define :category do |c|
  c.sequence(:name){|n| "Category #{n}"}
end

Factory.define :entry do |e|
  e.title {  Factory.next(:title) }
  e.association :user, :factory => :user
  e.association :category, :factory => :category
  e.body "OMG Ponies!!"
end


def published_entry(attrs = {})
  entry = Factory.create(:entry, attrs)
  entry.publish!
  entry
end
# Factory.define :category_entry do |ce|
#   ce.association :category, :factory => :category
#   ce.association :entry, :factory => :entry
# end

def activated_user(attributes = {})
  user = Factory(:user, attributes)
  user.activate!
  user
end

def activated_admin
  admin = Factory(:admin)
  admin.activate!
  admin
end