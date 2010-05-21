class CreateLawyers < ActiveRecord::Migration
  def self.up
    create_table :lawyers do |t|
      t.string :lawyer_name
      t.string :status
      t.integer :bar_number
      t.string :city
      t.date :admission_date

      t.timestamps
    end
  end

  def self.down
    drop_table :lawyers
  end
end
