(function() {
  jQuery(document).ready(function() {
    return jQuery('#pay_with_card').click(function() {
      var element, submitWithToken;
      element = jQuery(this);
      submitWithToken = function(res) {
        jQuery('input[name="stripeToken"]').val(res.id);
        return jQuery('#pay_with_card')[0].form.submit();
      };
      StripeCheckout.open({
        key: element.attr('data-key'),
        amount: element.attr('data-amount'),
        image: '/assets/oshpark_logo-394b5d59990e1feb769d201a1bca154982ac9b9d165f54cb25f119d5d3262aee.png',
        currency: 'usd',
        name: 'OSH Park',
        description: element.attr('data-description'),
        token: submitWithToken
      });
      return false;
    });
  });

}).call(this);
