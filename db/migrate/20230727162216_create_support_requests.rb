class CreateSupportRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :support_requests do |t|
      t.string :email, comment: "Email of the sbmitter"
      t.string :subject, comment: "Subject of thier support email"
      t.text :body, comment: "Body of thier support email"
      t.references :order, foreign_key: true, comment: "thier most recent order, if applicable"
      t.timestamps
    end
  end
end
