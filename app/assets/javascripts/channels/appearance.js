App.appearance = App.cable.subscriptions.create({
  channel: 'AppearanceChannel',
  room: window.location.pathname.split("/")[2]
}, {
    received: function (data) {
      var membership = JSON.parse(data)
      if (membership.online === true) {
        $(userImgIdConstructor(membership)).attr('class', 'active');
        var enter = $('#fixed-flash-enter')
        enter.text(membership.username + " has entered")
        fadeInOut(enter);
      };
      if (membership.online === false) {
        $(userImgIdConstructor(membership)).attr('class', 'inactive');
        var leave = $('#fixed-flash-leave')
        leave.text(membership.username + " has left")
        fadeInOut(leave);
      };
    }
  });


var userImgIdConstructor = function (membership) {
  return "#" + membership.user_id + "-status";
}

var alertFade = function (el) {
  $(el).delay(500).fadeIn('normal', function () {
    $(this).delay(2500).fadeOut();
  });
}

var semanticFade = function (el) {
  el.transition('vertical flip')
};

var fadeInOut = function (el) {
  semanticFade(el);
  window.setTimeout(function () { semanticFade(el) }, 2000)
}





$(document).ready(function () {

  if ($('#message-container').length > 0) {
    scrollBottom();
  };

  $('#add-users input').on('click', function () {
    var userId = $(this).attr("id").split("-")[0];
    var data = { user_id: userId };
    $.ajax({
      url: this.action,
      data: data,
      method: 'post'
    }).done(function (res) {
      var userData = JSON.parse(res);
      $('#' + userData.id + "-add-member").parent().remove();
      $('#member-list').append(memberAppendBuilder(userData));
    });
  });

  $('#new_message').on('submit', function () {
    event.preventDefault();
    // make sure there is content
    if ($('#new_message [name="message[content]"]').val() === "") {
      return false;
    }

    $.ajax({
      url: this.action,
      data: $(this).serialize(),
      method: "post"
    }).done(function (res) {
      // reset user input to empty
      $('#new_message [name="message[content]"]').val("");
    });
  });
});

var memberAppendBuilder = function (userData) {
  return "<div class='ui segment'><li>" + userData.username + "</li></div>";
};

var scrollBottom = function () {
  $('html, body').animate({ scrollTop: $(document).height() }, 2000);
};