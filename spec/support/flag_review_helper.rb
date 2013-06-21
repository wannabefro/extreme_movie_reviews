module FlagReview

  def flag_a_review(movie, review)
    visit movie_path(movie)
    click_on review[:title]
  end

end
