class DateSerializer < ActiveModel::Serializer
  attributes :best_day

  attribute :best_day do
    (object.created_at)
  end
end
