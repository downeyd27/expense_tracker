(function() {
  this.amountFormat = function(amount) {
    return '$ ' + Number(amount).toLocaleString();
  };

}).call(this);
