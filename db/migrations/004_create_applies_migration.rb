Sequel.migration do
  change do
    create_table!(:applies, :ignore_index_error=>true) do
    primary_key :id
    foreign_key :job_id, :jobs, :null=>false, :key=>[:id]
    foreign_key :geek_id, :geeks, :null=>false, :key=>[:id]
    TrueClass :read, :default=>false
    TrueClass :invited, :default=>false

    DateTime :created_at
    DateTime :updated_at

    index :id
    end
  end
end