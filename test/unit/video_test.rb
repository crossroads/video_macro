require File.join(File.dirname(__FILE__), 'unit_test_helper')

class VideoMacroTest < Test::Unit::TestCase

  FIXTURE = 'sample'

  def test_macro_contents
    params = {'file' => "2009-05-06_1628_CreateHAYD.swf",
              'width' => 892,
              'height' => 640 }
    video = VideoMacro.new(params, project(FIXTURE), nil)
    result = video.execute
    assert video.execute == '<embed src="http://mingle-assets.crossroads.org.hk/2009-05-06_1628_CreateHAYD.swf" width="892" height="640" />'
  end

end

