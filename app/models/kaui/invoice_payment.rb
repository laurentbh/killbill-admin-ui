class Kaui::InvoicePayment < KillBillClient::Model::InvoicePayment

  SAMPLE_REASON_CODES = [ '600 - Alt payment method',
                          '699 - OTHER']

  [:auth, :captured, :purchased, :refunded, :credited].each do |type|
    define_method "#{type}_amount_to_money" do
      Kaui::Base.to_money("#{type}_amount", currency)
    end
  end

  def is_fully_refunded?
    refunded_amount == captured_amount || refunded_amount == purchased_amount
  end
end
