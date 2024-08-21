class Documents::Fetcher
  def call
    Documents::Base.constants.map do |const|
      [const, Documents::Base.const_get(const)]
    end.to_h
  end
end
