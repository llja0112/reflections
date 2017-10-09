module ReflectionsHelper
  def reflection_card_class(reflection)
    if user_signed_in?
      if reflection.user == current_user
        class_string = 'border-primary'
      elsif reflection.reviewers.include?(current_user)
        class_string = 'border-warning'
      else
        class_string = 'border-info'
      end
      return class_string
    end
  end

  def privacy_share_form(privacy)
    if privacy == 'Private'
      return {tag: 'div', class: 'form-group'}
    else
      return {tag: 'div', class: 'form-group', hidden: ''}
    end
  end
end
