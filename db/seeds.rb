# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create!(:email => 'user@example.com', :password => 'password', :password_confirmation => 'password')

glossary = Glossary.create!(:name => "demo")
glossary.update_attribute(:user, user)

category = Category.create!(:name => "lorem ipsum")
category.update_attribute(:user, user)

lipsum = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur accumsan, sem vitae euismod interdum, nisi justo vulputate mi, in placerat nisl sapien ac lorem. Nulla porta facilisis luctus. Aliquam vulputate nisi elit. Donec porttitor ullamcorper sapien, eu lobortis magna lobortis in. Etiam tincidunt quam eu sapien mollis blandit. Nullam mattis, lorem ut facilisis commodo, sem quam mattis velit, ac tristique metus sem eget orci. Suspendisse venenatis ipsum et odio semper interdum sed ac tortor. Nam tempus vehicula consequat. Vivamus non dui quam, a volutpat metus. Mauris feugiat pharetra tortor, et vulputate mauris volutpat eget. Integer lobortis vulputate dignissim. Suspendisse ultricies tincidunt nibh vitae scelerisque."
lipsum.gsub!(/[.,]/, '')


lipsum.split(' ').each do |w|
  word = glossary.words.create(:name => w, :description => lipsum, :category => category)
  word.update_attribute(:user, user)
end

