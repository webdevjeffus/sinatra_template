class Thing < ActiveRecord::Base
  belongs_to  :user

  validates   :name,  presence: true,
                      uniqueness: true,
                      length: {
                        in: 4..64,
                        too_short: "must be at least %{count} characters long.",
                        too_long: "is limited to %{count} characters."
                      }

  validates   :description, presence: true,
                        length: {
                          in: 3..250,
                          too_short: "must be at least %{count} characters long.",
                          too_long: "is limited to %{count} characters."
                        }

  validates   :user_id, presence: true

end
