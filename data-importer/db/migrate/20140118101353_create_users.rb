class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :identity_url
      t.string :remember_token
    end
  end
end
