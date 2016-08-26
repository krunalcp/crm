module ApplicationHelper

  def select_user_data
    User.all.map{|c| [c.email,c.id] }
  end

  def select_person_name
    Person.all.map{|n| [n.first_name, n.id]}
  end

  def select_person_tag
    PersonTag.all.map{|t| [t.tag_name, t.id]}
  end
end
