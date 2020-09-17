module LandingPageHelper
  def change_class(number, cond1, cond2)
    if number.blank?
      ''
    else
      'ativo' if number > cond1 && number <= cond2
    end
  end

  def change_class_text(number, cond)
    if number.blank?
      ''
    else
      if number >= cond 
        'text-main'
      else
        'text-gray-PJA'
      end 
    end
  end
end
