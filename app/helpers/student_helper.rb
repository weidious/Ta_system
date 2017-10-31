module StudentHelper
    def students_for_select
        Student.all.collect { |student| [student.fullname, student.id] }
    end
end
