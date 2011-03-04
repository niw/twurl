require File.expand_path('../test_helper', __FILE__)

class Twurl::Options::Test < Test::Unit::TestCase
  attr_reader :options
  def setup
    @options = Twurl::Options.new
  end

  def test_base_url_is_built_from_protocol_and_host
    options.protocol = 'http'
    options.host     = 'api.twitter.com'

    assert_equal 'http://api.twitter.com', options.base_url
  end

  def test_ssl_is_enabled_if_the_protocol_is_https
    options.protocol = 'http'
    assert !options.ssl?

    options.protocol = 'https'
    assert options.ssl?
  end
end