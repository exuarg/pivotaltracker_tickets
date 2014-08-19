Given(/^an user goes to guitarcenter\.com$/) do
  @Browser = Watir::Browser.new :ff
  @Browser.goto "guitarcenter.com"
  @Browser.div(:id=>"gc_redesign_header_sub_nav").wait_until_present

end

When(/^they click on guitars under the products tab$/) do
 @Browser.div(:id=>"gc_redesign_header_sub_nav").wait_until_present
 @Browser.link(:text=> "Guitars").click
 @Browser.div(:class=>"nav-block block-open").wait_until_present
end

Then(/^they can see list of brands of guitars$/) do
 x =  @Browser.div(:class=>"nav-block block-open").text
  puts x

 string = "#{x}"
 if string.include? "Guitar"
   puts "Page Contains 'Guitar' Items"
 end
end

When(/^they click on bass under the products menu$/) do
  @Browser.link(:text=> "Bass").click
  @Browser.div(:class=>"nav-block block-open").wait_until_present
end

Then(/^they get redirected to http:\/\/www\.guitarcenter\.com\/Bass\.gc$/) do

  x =  @Browser.div(:class=>"nav-block block-open").text
  puts x

  string = "#{x}"
  if string.include? "Bass"
    puts "Page Contains 'Bass' Items"
    end
end

When(/^they select drums under the products menu$/) do
  @Browser.link(:text=> "Drums").click
  @Browser.div(:class=>"nav-block block-open").wait_until_present
end

Then(/^they can see a list of drum and percussion items$/) do
  x =  @Browser.div(:class=>"nav-block block-open").text
  puts x

  string = "#{x}"
  if string.include? "Drums"
    puts "Page Contains 'Drums' Items"
  end
end

When(/^they click on the recording & software link under the products menu$/) do
  @Browser.link(:text=> "Recording & Software").click
  @Browser.div(:class=>"nav-block block-open").wait_until_present
end

Then(/^they can see quantities of models on each category of such product$/) do
  x =  @Browser.div(:class=>"nav-block block-open").text
  puts x

  puts "Quatities in stock of first 4 categories of recording and software items"
  puts x.scan(/\d+/)
  # print "Items is first category for Drums results"
  # puts  /-?(0|([1-9]\d*))(\.\d+)?/.match(x)
end


When(/^they click on search field and input "([^"]*)"$/) do |arg|
  @Browser.input(:id=> "header-search-input").click
  @Browser.text_field(:id=> "header-search-input").set "#{arg}"
  @Browser.text_field(:id=> "header-search-input").send_keys :enter
end

Then(/^user gets zero results because its an invalid search word$/) do
  @Browser.div(:id=>"gc_redesign_header_sub_nav").wait_until_present
 y= @Browser.div(:class=>"search-title html-content-isolated").text
puts y
end