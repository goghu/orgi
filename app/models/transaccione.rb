class Transaccione < ApplicationRecord
	belongs_to :user
	belongs_to :categorium, foreign_key: "categoria_id", optional: true
	belongs_to :proyecto, optional: true
end
