require 'test_helper'

class ShortLinkTest < ActiveSupport::TestCase
  test "should not save short_link without original_url" do
    short_link = ShortLink.new(
      shortened_url_key: 'abc',
      admin_url_key: '123'
    )

    assert !short_link.save
  end

  test "should not save short_link without shortened_url_key" do
    short_link = ShortLink.new(
      original_url: 'https://google.com',
      admin_url_key: '123'
    )

    assert !short_link.save
  end

  test "should not save short_link without admin_url_key" do
    short_link = ShortLink.new(
      original_url: 'https://google.com',
      shortened_url_key: 'abc'
    )

    assert !short_link.save
  end

  test(
    "should save short_link with original_url, " +
    "shortened_url_key, and admin_url_key"
  ) do
    short_link = ShortLink.new(
      original_url: 'https://google.com',
      shortened_url_key: 'abc',
      admin_url_key: '123'
    )

    assert short_link.save
  end
end
