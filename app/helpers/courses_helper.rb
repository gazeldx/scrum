module CoursesHelper
  def begin_end_time(course)
    start = course.start_time
    end_time = course.end_time
    if start.month != end_time.month
      "#{start.year}#{t'year'}#{start.month}#{t'month'}#{start.day}#{t'day'} #{t('to')} #{end_time.month}#{t'month'}#{end_time.day}#{t'day'}"
    else
      "#{start.year}#{t'year'}#{start.month}#{t'month'}#{start.day}#{t'day'} #{t('to')} #{end_time.day}#{t'day'}"
    end
  end

  def place_detail course
    if course.location == t('beijing')
      t('place.beijing')
    elsif course.location == t('shanghai')
      t('place.shanghai')
    else
      t('place.shenzhen')
    end
  end
end
