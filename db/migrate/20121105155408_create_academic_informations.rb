class CreateAcademicInformations < ActiveRecord::Migration
  def change
    create_table :academic_informations do |t|
      t.float :cpi
      t.integer :student_id

      t.timestamps
    end
  end
end
