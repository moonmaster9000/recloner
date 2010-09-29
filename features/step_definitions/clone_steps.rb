Given /^there is a document in the database$/ do
  @book = Book.create :name => "test book" 
end

When /^I clone! that document$/ do
  @cloned_book = @book.clone! {|b| b.name += " persisted clone"}
end

Then /^a copy of the document should exist in memory$/ do
  @cloned_book.class.should == Book
end

Then /^a copy of the document should also be persisted to the database$/ do
  @cloned_book.id.should_not be_nil
  Book.all.count.should == 2
end

When /^I soft clone that document$/ do
  @cloned_book = @book.clone {|b| b.name += " soft clone"}
end

Then /^there should only be a single document in the database$/ do
  @cloned_book.new_record?.should be_true
  Book.all.count.should == 1
end

