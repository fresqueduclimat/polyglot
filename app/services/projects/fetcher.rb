class Projects::Fetcher
  def call
    Documents::Fdc.constants.map do |const|
      [const, Documents::Fdc.const_get(const)]
    end.to_h
  end
end
