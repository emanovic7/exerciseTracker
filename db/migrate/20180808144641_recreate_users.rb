class RecreateUsers < ActiveRecord::Migration[5.2]
  def change
    def change
      create_table :users do |t|
        t.string :user_name
        t.string :email
        t.string :password_digest
        t.string :first_name
        t.string :last_name
      end
    end
  end
end
