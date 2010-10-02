class VideoMacro
  def initialize(parameters, project, current_user)
    require 'uri'
    @parameters = parameters
    @mingle_assets_baseurl = "http://mingle-assets.crossroads.org.hk"
  end

  def execute
    src_url = URI.join(@mingle_assets_baseurl, @parameters['file'].strip).to_s
    %Q{<embed src="#{src_url}" width="#{@parameters['width']}" height="#{@parameters['height']}" />}
  end

  def can_be_cached?
    true
  end

end

