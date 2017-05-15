class User < ApplicationRecord
  has_secure_password
  validates :first_name, :last_name, :email, :password, presence: true

  validates :email, uniqueness: true
  validates :password, length: {in: 6..30}
  validates :email, uniqueness: true, format: {with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/}


  has_many :attendances
  has_many :concerts, through: :attendances

  def user_is_attending?(user)
		self.attendances.include?(user)
	end

	def find_attendance(user)
		Attendance.find_by(user_id: user.id, concert_id: self.id)
	end



end

# Concert.attendances.find_by(user_id: (Leon.id))
