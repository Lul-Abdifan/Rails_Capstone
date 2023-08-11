module RecipesHelper
  def format_time(minutes)
    hours = minutes / 60
    minutes = minutes % 60
    "#{hours} hours #{minutes} minutes"
  end
end
