class CreatePosts < ActiveRecord::Migration[5.2]
	def change
		
    	create_table :posts do |t|
			t.string :title
			t.text :description
			t.string :writer
			t.string :password
			t.string :subject
			t.string :time 
   		end

	end
end
