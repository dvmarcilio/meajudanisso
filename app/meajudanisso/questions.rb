require 'questions/presenters/collection'

module MeAjudaNisso
	module Questions
		def self.most_voted
			Presenters::Collection.for(::Question.most_voted)
		end
	end
end
