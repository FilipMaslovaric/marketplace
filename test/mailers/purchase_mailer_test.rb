require 'test_helper'

class PurchaseMailerTest < ActionMailer::TestCase
  test "confirm_purchase" do
    mail = PurchaseMailer.confirm_purchase
    assert_equal "Confirm purchase", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
