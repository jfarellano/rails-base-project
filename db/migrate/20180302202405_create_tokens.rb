class CreateTokens < ActiveRecord::Migration[5.1]
  def change
    create_table :tokens do |t|
      t.string :secret
      t.date :expire_at
      t.integer :user_id
      
      t.timestamps
    end
  end
end
