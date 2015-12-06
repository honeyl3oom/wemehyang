class Time
  def to_stime
    self.strftime("%F %T")
  end
  def to_dtime
    self.strftime("%f")
  end
end
