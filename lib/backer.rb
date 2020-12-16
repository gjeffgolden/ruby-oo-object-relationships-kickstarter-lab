require 'pry'

class Backer
    attr_reader :name

    @@all = []

    def initialize name
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def back_project project
        ProjectBacker.new project, self
    end

    def backed_projects
        ProjectBacker.all.select do |projects|
            projects.backer == self
        end.map do |project|
            project.project
        end
    end

end