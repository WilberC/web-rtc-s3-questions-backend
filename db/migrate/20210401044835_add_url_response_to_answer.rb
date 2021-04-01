class AddUrlResponseToAnswer < ActiveRecord::Migration[6.0]
  def change
    add_column :answers, :url_response, :text
  end
end
