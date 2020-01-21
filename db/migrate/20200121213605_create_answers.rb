class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.column(:response, :string)

      t.timestamps()
    end
  end
end
