class CreateLinkCommunities < ActiveRecord::Migration
  def change
    create_table :link_communities do |t|
      t.integer :link_id
      t.integer :community_id

      t.timestamps
    end
  end
end
