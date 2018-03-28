class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :user_projects
  mount_uploader :avatar, PhotoUploader
  has_many :projects, through: :user_projects
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :invite_for => 2.weeks
  acts_as_tagger

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.not_in_the_project(project)
    self.all.select {|user| !user.projects.include? project}
  end

  acts_as_voter
  def likes
    self.votes.up.for_type(Item)
  end

  def picture
    if avatar.blank?
      avatar_list = ["avatar1.jpg", "avatar2.jpg", "avatar3.jpg"]
      avatar_url = avatar_list[rand(3)]
    else
      avatar_url
    end
  end
end
