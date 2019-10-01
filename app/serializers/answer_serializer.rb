class AnswerSerializer < ActiveModel::Serializer
  attributes :id, :user_name, :description

  def user_name
    object.user.name
  end
end
