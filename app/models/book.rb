# == Schema Information
#
# Table name: books
#
#  id         :bigint           not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Book < ApplicationRecord
end
