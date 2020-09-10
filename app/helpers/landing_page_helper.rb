module LandingPageHelper
  def change_class_200(number)
    if number.blank?
      'bg-main text-white'
    else
      if number <= 200
        'bg-main text-white'
      else
        'bg-white text-gray-400'
      end
    end
  end

  def change_class(number, cond1, cond2)
    if number.blank?
      'bg-white text-gray-400'
    else
      if number > cond1 && number <= cond2
        'bg-main text-white'
      else
        'bg-white text-gray-400'
      end
    end
  end
end
