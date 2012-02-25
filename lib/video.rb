class VideoMacro
  def initialize(parameters, project, current_user)
    require 'uri'
    @parameters = parameters
    @mingle_assets_baseurl = "http://mingle-assets.crossroads.org.hk"
  end

  def execute
    file, width, height = if @parameters['params']
      @parameters['params'].split('|').map{|p| p.strip }
    else
      %w(file width height).map{|p| @parameters[p] }
    end
    
    src_url = URI.join(@mingle_assets_baseurl, file.strip).to_s
    %Q{<embed type="application/x-shockwave-flash" src="#{src_url}" width="#{width}" height="#{height}" />}
  end

  def can_be_cached?
    true
  end

end

