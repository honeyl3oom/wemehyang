class AddColumnPasswordDigestToPsInfo < ActiveRecord::Migration
  def change
    add_column :ps_infos, :password_digest, :string
  end
end
