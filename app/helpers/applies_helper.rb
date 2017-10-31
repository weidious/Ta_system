module AppliesHelper
    def appTypes_for_select(defaultItem)
        options_for_select((1..3).map { |i| [Apply.appTypeEnum(i), i] }, defaultItem)
    end
end
