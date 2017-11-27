module CoursesHelper
    def courses_for_select
        Course.all.collect {|cs| [ cs.caption, cs.id ] }
    end
end
