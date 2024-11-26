class User < ApplicationRecord
  audited max_audits: 100, on: %i[create update], only: [:student_id, :email]

  devise :database_authenticatable, :rememberable,
         :validatable, :trackable, :timeoutable,
         :registerable, :lockable, authentication_keys: [:student_id]

  enum role: { admin: 0, student: 1 }

  def email_required?
    false
  end
end
