$(function() {
'use strict';

 var elements = stripe.elements({
    // Stripe's examples are localized to specific languages, but if
    // you wish to have Elements automatically detect your user's locale,
    // use `locale: 'auto'` instead.
    locale: window.__exampleLocale
  });
  
  var elementStyles = {
    base: {
      color: '#32325D',
      fontWeight: 500,
      fontFamily: 'Source Code Pro, Consolas, Menlo, monospace',
      fontSize: '16px',
      fontSmoothing: 'antialiased',

      '::placeholder': {
        color: '#CFD7DF',
      },
      ':-webkit-autofill': {
        color: '#e39f48',
      },
    },
    invalid: {
      color: '#E25950',

      '::placeholder': {
        color: '#FF88A5',
      },
    },
  };

  var elementClasses = {
    focus: 'focused',
    empty: 'empty',
    invalid: 'invalid',
  };

// Create an instance of the card Element
var card = elements.create('card', {
    style: elementStyles,
    classes: elementClasses,
  });

// Add an instance of the card Element into the `card-element` <div>
card.mount('#card-element');

registerElements([card], "_cc_details_form.html.erb");
})();
