class Project
    attr_reader :title

    @@all = []

    def initialize title
        @title = title
        @@all << self
    end

    def self.all
        @@all
    end

    def add_backer backer
        ProjectBacker.new self, backer
    end

    def backers
        ProjectBacker.all.select do |projects|
            projects.project == self
        end.map do |project|
            project.backer
        end 
    end

end