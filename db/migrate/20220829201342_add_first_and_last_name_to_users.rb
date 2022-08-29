class AddFirstAndLastNameToUsers < ActiveRecord::Migration[6.1]
  def change

    add_column :users, :last_name, :string
    rename_column :users, :name, :first_name

    # create_table :users do |t|
    #   t.string :first_name
    #   t.string :last_name
    #   t.string :email
    #   t.string :password_digest

    #   t.timestamps

    # end

  end
end
