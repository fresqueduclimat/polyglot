class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string(:uuid, null: false)
      t.string(:email, null: false)
      t.string(:password_digest, null: false)
      t.string(:firstname)
      t.string(:lastname)

      t.timestamps
    end

    add_index(:users, :uuid, unique: true)
    add_index(:users, :email, unique: true)
  end
end
