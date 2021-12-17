require "pry"

class Dog

    def intialize id = nil, name, breed
        @id = id
        @name = name
        @breed = breed
    end

    def self.create_table
        DB[:conn].execute("DROP TABLE IF EXISTS dogs")
        Dog.create_table
        table_check_sql = "SELECT tbl_name FROM sqlite_master WHERE type='table' AND tbl_name='dogs';"
        expect(DB[:conn].execute(table_check_sql)[0]).to eq(['dogs'])
    end

end
binding.pry