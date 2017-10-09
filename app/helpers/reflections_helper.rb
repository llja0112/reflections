module ReflectionsHelper
  def reflection_card_class(reflection)
    if user_signed_in?
      if reflection.user == current_user
        class_string = 'primary'
      elsif reflection.reviewers.include?(current_user)
        class_string = 'warning'
      else
        class_string = 'info'
      end
    else
      class_string = 'info'
    end
    return class_string
  end

  def reflection_card_description(reflection)
    if reflection.user == current_user
      description_string = 'Personal reflection'
    elsif reflection.reviewers.include?(current_user)
      description_string = 'For your review'
    elsif reflection.privacy == 'Private'
      description_string = 'Shared with you'
    else
      description_string = 'Public reflection'
    end
    return description_string
  end

  def privacy_share_form(privacy)
    if privacy == 'Private'
      return {tag: 'div', class: 'form-group'}
    else
      return {tag: 'div', class: 'form-group', hidden: ''}
    end
  end
end
