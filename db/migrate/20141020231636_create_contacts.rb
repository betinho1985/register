class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      #name, last_name, email, company, job_title, phone, website
      t.string :name
      t.string :last_name
      t.string :email
      t.string :company
      t.string :job_title
      t.string :phone
      t.string :website
      t.string :client
      t.timestamps
    end
  end
end
