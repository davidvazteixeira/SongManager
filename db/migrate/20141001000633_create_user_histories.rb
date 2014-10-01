class CreateUserHistories < ActiveRecord::Migration
  def change
    create_table :user_histories do |t|
      t.references :user, index: true
      t.references :song_history, index: true
    end
  end
end
