class UpcaseValidator < ActiveModel::Validator
  def validate(record)
    if record.name.first != record.name.first.upcase
      record.errors[:base] << "Name should start with capital letter"
    end
  end
end

class Article < ApplicationRecord
	
  belongs_to :user	
  has_many :comments, dependent: :destroy
  enum status: { pending: 0, published: 1, active: 2, inactive: 3 }
  validates_with UpcaseValidator
  validate :set_something_in_model, on: :create
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
  validates :name, presence: true, length: { minimum: 2 }, uniqueness: true
  validates :description, presence: true, length: { minimum: 5 }, uniqueness: true
  validates :terms_of_service, acceptance: true

	before_validation :before_validation_method
	after_validation :after_validation_method
	before_save :before_save_method
	around_save :around_save_method
	before_create :before_create_method
	around_create :around_create_method
	after_commit :after_commit_method
	after_save :after_save_method
	after_create :log_destroy_action
	after_rollback :rollback_method
	before_commit :before_commit_method

	private

		def set_something_in_model
	    if self.description.first != self.description.first.upcase
	      self.errors[:base] << "Description should start with capital letter"
	    end
		end

		def before_commit_method
			puts 'before_commit'
		end	

	  def log_destroy_action
			puts 'after_create article'
	  end

	  def before_validation_method
			puts 'before_validation'
	  end

	  def after_validation_method
			puts 'after_validation'
	  end

	  def before_save_method
			puts 'before_save'
	  end

	  def around_save_method
			puts 'around_save'
			yield
	  end

	  def before_create_method
			puts 'before_create'
	  end

	  def around_create_method
			puts 'around_create'
			yield
	  end

	  def after_commit_method
			puts 'after_commit'
	  end

	  def after_save_method
			puts 'after_save'
	  end

	  def rollback_method
			puts 'after_rollback'
	  end

end
