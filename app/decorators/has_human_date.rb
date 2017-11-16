module HasHumanDate
  def human_date_created_at
    human_created_at[/[\d]{4}-[\d]{,2}-[\d]{,2}/]
  end

  def human_created_at
    human_date_on(:created_at)
  end

  def human_date_on(field)
    date(send(field))
  end

  private

  def date(date)
    date.strftime('%Y-%m-%d, %H:%M')
  end
end
