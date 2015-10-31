class AddRequiredFields < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
    	t.change :email, :string, null: false
    	t.change :username, :string, null: false
    	t.change :password, :string, null: false
    end
    change_table :posts do |t|
    	t.change :subject, :string, null: false
    end
  end
 
  def self.down
    change_table :users do |t|
    	t.change :email, :string
    	t.change :username, :string
    	t.change :password, :string
    end
    change_table :posts do |t|
    	t.change :subject, :string
    end
  end
end
