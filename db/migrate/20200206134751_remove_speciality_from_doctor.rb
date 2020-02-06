class RemoveSpecialityFromDoctor < ActiveRecord::Migration[6.0]
  def change
  	remove_reference :doctors, :speciality
  	remove_column :doctors, :speciality
  end
end
