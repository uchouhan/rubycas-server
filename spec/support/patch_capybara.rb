# Ugly monkeypatch to allow us to test for correct redirection to
# external services.
#
# This will likely break in the future when Capybara or RackTest are upgraded.
class Capybara::Driver::RackTest
  alias_method :original_follow_redirects!, :follow_redirects!
  alias_method :original_current_url, :current_url

  def current_url
    if @redirected_to_external_url
      @redirected_to_external_url
    else
      original_current_url
    end
  end

  def follow_redirects!
    if response['Location'] =~ /^http:/
      @redirected_to_external_url = response['Location']
    else
      original_follow_redirects!
    end
  end
end
