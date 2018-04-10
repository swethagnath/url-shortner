class UrlGenerator < ApplicationRecord
	belongs_to :user
	before_create :calculating_encoded_url
	def eight_chara
		char_number = ('0'..'9').to_a;
		char_caps_alphabets = ('A'..'Z').to_a;
		char_small_alphabets = ('a'..'z').to_a;
		password_array = char_number + char_caps_alphabets + char_small_alphabets;
		array = [];	
		i = 0
		while i < 8
			array.push(password_array.sample(1));
			i += 1;
		end
		array.join("")
	end
	def calculating_encoded_url	
		short_url = eight_chara;
		while true 
			value = UrlGenerator.find_by(encoded_url:short_url);
			if value === nil 
				self.encoded_url = short_url;
				break;
			else
				short_url = eight_chara;
			end			
		end
	end
end
