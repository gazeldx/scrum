#encoding = utf-8

module CoursesHelper
  def begin_end_time(course)
    start = course.start_time
    end_time = course.end_time
    if start.month != end_time.month
      "#{start.strftime('%F')} ~ #{end_time.strftime('%m-%d')}"
    else
      "#{start.strftime('%F')} ~ #{end_time.strftime('%d')}"
    end
  end

  def highlight?(course)
    course.active? &&
    course.trainer.url == "Arne-Ahlander"
  end
end
