Sequel.migration do
  change do
    create_table!(:jobs, :ignore_index_error=>true) do
    primary_key :id
    String :name, :text=>true, :null=>false
    String :place, :text=>true, :null=>false
    foreign_key :company_id, :companies, :null=>false, :key=>[:id]

    DateTime :created_at
    DateTime :updated_at

    index :id

    end
  end
end