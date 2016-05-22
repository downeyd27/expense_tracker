(function() {
  this.Record = React.createClass({
    handleDelete: function(e) {
      e.preventDefault();
      return $.ajax({
        method: "DELETE",
        url: "/records/" + this.props.record.id,
        dataType: "JSON",
        success: (function(_this) {
          return function() {
            return _this.props.handleDeleteRecord(_this.props.record);
          };
        })(this)
      });
    },
    render: function() {
      return React.DOM.tr(null, React.DOM.td(null, this.props.record.date), React.DOM.td(null, this.props.record.title), React.DOM.td(null, amountFormat(this.props.record.amount)), React.DOM.td(null, React.DOM.a({
        className: 'btn btn-primary',
        onClick: this.handleDelete
      }, 'Delete')));
    }
  });

}).call(this);
