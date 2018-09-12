App.product = App.cable.subscriptions.create("ProductChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    // Called when there's incoming data on the websocket for this channel

    
    $(".alert.alert-info").show();

  },

  listen_to_comments: function() {
    // App refers to everything that is defined above
    // App.product is the subscriber object for the product channel
    // You could also use this.perform() instead
    return App.product.perform('listen', {
      product_id: $("[data-product-id]").data("product-id")
    });
  }

});

$(document).on('turbolinks:load', function() {
  App.product.listen_to_comments();
});
