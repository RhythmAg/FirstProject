class UpcaseValidator < ActiveModel::Validator
  def validate(record)
    if record.name.first != record.name.first.upcase
      record.errors[:base] << "Name should start with capital letter"
    end
  end
end