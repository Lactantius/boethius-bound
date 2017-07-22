json.extract! book, :id, :title, :author, :location, :converter, :heads, :language, :pubdate, :created_at, :updated_at
json.url book_url(book, format: :json)
