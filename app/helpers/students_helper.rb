module StudentsHelper
    def students_for_select
        Student.all.collect {|s| [ s.fullname, s.id ] }
    end
end
