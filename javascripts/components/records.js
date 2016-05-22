(function() {
  this.Records = React.createClass({
    getInitialState: function() {
      return {
        records: this.props.data
      };
    },
    getDefaultProps: function() {
      return {
        records: []
      };
    },
    addRecord: function(record) {
      var records;
      records = this.state.records.slice();
      records.push(record);
      return this.setState({
        records: records
      });
    },
    render: function() {
      var record;
      return React.DOM.div({
        className: 'records'
      }, React.DOM.h2({
        className: 'title'
      }, 'Records'), React.createElement(RecordForm, {
        handleNewRecord: this.addRecord
      }), React.DOM.hr(null), React.DOM.table({
        className: 'table table-bordered'
      }, React.DOM.thead(null, React.DOM.tr(null, React.DOM.th(null, 'Date'), React.DOM.th(null, 'Title'), React.DOM.th(null, 'Amount'))), React.DOM.tbody(null, (function() {
        var i, len, ref, results;
        ref = this.state.records;
        results = [];
        for (i = 0, len = ref.length; i < len; i++) {
          record = ref[i];
          results.push(React.createElement(Record, {
            key: record.id,
            record: record
          }));
        }
        return results;
      }).call(this))));
    }
  });

}).call(this);
