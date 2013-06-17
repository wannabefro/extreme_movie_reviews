module ReviewHelper

  def write_review(review)
    fill_in "eXtreme Review Headline", with: review[:title]
    fill_in "Your eXtreme Review", with: review[:body]

    click_on "Add a Review"
  end

end