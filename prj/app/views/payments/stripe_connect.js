(function() {
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
  
  var cardNumber = elements.create('cardNumber', { 
65     style: elementStyles, 
66     classes: elementClasses, 
67   }); 
68   cardNumber.mount('#example2-card-number'); 
69 
 
70   var cardExpiry = elements.create('cardExpiry', { 
71     style: elementStyles, 
72     classes: elementClasses, 
73   }); 
74   cardExpiry.mount('#example2-card-expiry'); 
75 
 
76   var cardCvc = elements.create('cardCvc', { 
77     style: elementStyles, 
78     classes: elementClasses, 
79   }); 
80   cardCvc.mount('#example2-card-cvc'); 
81 
 
82   registerElements([cardNumber, cardExpiry, cardCvc], 'example2'); 


// Add an instance of the card Element into the `card-element` <div>
card.mount('#card-element');

registerElements([card], "payment-form");
})();