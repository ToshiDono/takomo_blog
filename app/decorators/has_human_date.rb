module HasHumanDate
  def human_created_at
    human_date_on(:created_at)
  end

  def human_date_on(field)
    date(send(field))
  end

  private

  def date(date)
    date.strftime("%Y-%m-%d")
  end
end
