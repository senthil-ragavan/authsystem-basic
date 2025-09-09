class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false, index: { unique: true }
      t.string :phone_number
      t.string :password_digest, null: false  # for has_secure_password

      t.timestamps
    end
  end
end
