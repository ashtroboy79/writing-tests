require 'library.rb'

describe Library do
  # Arrange
  my_library = Library.new
  new_book = {title: 'THUD!', author: 'Terry Pratchett', subject: 'Fiction'}
  ruby_books = [{:title=>"Learn Ruby The Hard Way", :author=>"Zed Shaw", :subject=>"Ruby"}, 
    {:title=>"The Well Grounded Rubyist", :author=>"Sandi Metz", :subject=>"Ruby"}]
  old_book = "The Well Grounded Rubyist"

  it 'can find a specific book' do
    #Act 
    #my_library.find_book('POODR')
    expect(my_library.find_book('POODR')).to eq({:title=>"POODR", :author=>"Sandi Metz", :subject=>"OOP"} )
  end

  it 'can add a new book' do
    my_library.add_book(new_book)
    expect(my_library.list_books).to include(new_book)
  end

  it 'can remove a book' do
    my_library.remove_book(old_book)
    expect(my_library.list_books).not_to include(old_book)
  end

  it 'can list all the books on a specific subject' do
    #Arrange as we've remove the 'The Well Grounded Rubyist, lets add it back here
    my_library.add_book({:title=>"The Well Grounded Rubyist", :author=>"Sandi Metz", :subject=>"Ruby"})
    expect(my_library.all_books_by_subject('Ruby')).to eq(ruby_books)
  end
end
