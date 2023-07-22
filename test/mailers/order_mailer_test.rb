require "test_helper"

class OrderMailerTest < ActionMailer::TestCase
  test "received" do
    mail = OrderMailer.received(orders(:one))
    assert_equal "Depot App Confirmation"
    assert_equal ["dumemailfordev@gmail.com"], mail.to
    assert_equal ["dumemailfordev@gmail.com"], mail.from
    assert_match %r(
        <td[^>]*>1<\/td>\s*
        <td>&times;<\/td>\s*
        <td[^>]*>\s*Programming\sRuby\s3.2.2\s*</td>
        )x, mail.body.to_s
  end

  test "shipped" do
    mail = OrderMailer.shipped(orders(:one))
    assert_equal "Depot App Order Shipped!"
    assert_equal ["dumemailfordev@gmail.com"], mail.to
    assert_equal ["dumemailfordev@gmail.com"], mail.from
    assert_match %r(
        <td[^>]*>1<\/td>\s*
        <td>&times;<\/td>\s*
        <td[^>]*>\s*Programming\sRuby\s3.2.2\s*</td>
        )x, mail.body.to_s

  end

end
