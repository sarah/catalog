Given /^there are (\d+) published entries in each category$/ do |num_categories|
  categories = Category.find :all
  categories.each do |category|
    num_categories.to_i.times do 
      entry = published_entry(:category => category)
      entry.publish!
    end
  end
end

Then /^there should be (\d+) entries shown in each category$/ do |num_entries|
  categories = Category.all
  categories.each do |category|
    response.should have_selector("ul#category_#{category.id}") do |category_list|
      category_list.should have_selector("li.entry", :count => num_entries  )
    end
  end
end

