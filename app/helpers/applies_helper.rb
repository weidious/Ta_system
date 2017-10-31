module AppliesHelper
    def appTypes_for_select
        (1..3).map {|i| [Apply.appTypeEnum(i), i]}
        # => [["TA", 1], ["Senor Grader", 2], ["Grader", 3]
    end
end
