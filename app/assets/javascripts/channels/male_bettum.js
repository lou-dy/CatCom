App.male_bettum = App.cable.subscriptions.create("MaleBettumChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    // Called when there's incoming data on the websocket for this channel
    $(".alert-info").show().delay(2000).fadeOut(800);
    $('.product-reviews').prepend(data.comment);
    $("#average-rating").attr('data-score', data.average_rating);
    refreshRating();
  },

  listen_to_comments: function() {
    return this.perform('listen', {
      male_bettum_id: $("[data-male-bettum-id]").data("male-bettum-id")
    });
  }
});

$(document).on('turbolinks:load', function() {
  App.male_bettum.listen_to_comments();
});
