module CoursesHelper
  def begin_end_time(course)
    "#{course.start_time.strftime(t('date_format'))} #{t('to')} #{course.end_time.strftime(t('date_without_year'))}"
  end

  def place_detail course
    if course.location == t('beijing')
      t('place.beijing')
    else
      t('place.shanghai')
    end
  end
end
