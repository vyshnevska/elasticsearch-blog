var chart, chartOptions;

// Common chart options
chartOptions = {
  chart: {
    renderTo: 'chart-sample',
    events: {
      load: function() {
        chart = this;
        loadChartLabel();
        requestData();
      }
    },
    animation: {
      duration: 1000
    }
  },
  title: {
    text: 'Total Sample chart Data'
  },
  subtitle: {
    text: 'past few days'
  },
  xAxis: {
    categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
  },
  yAxis: [{
    title: {
      text: 'Sample Data'
    }
  }],
  series: [
    { name: 'Line 1', data: [] },
    { name: 'Line 2', data: [] }
  ]
};


// Fetch chart data
function requestData(){
  $.get('/articles/dots_chart_data', { cache: false })
    .success(function (response){
      $.each(response, function(index, response){
        chart.series[index].setData(
          response.data, true
        );
      });
      setTimeout(requestData, 1000);
    });
};

// Onload label
function loadChartLabel() {
  var label = chart.renderer.label('Chart loaded', 100, 120)
      .attr({
        fill: Highcharts.getOptions().colors[0],
        padding: 10,
        r: 5,
        zIndex: 8
      })
      .css({
        color: '#FFFFFF'
      })
      .add();

  setTimeout(function () {
    label.fadeOut();
  }, 2000);
};

// Render chart depending on type
function renderChartByType(chartType) {
  chartOptions.chart.type = chartType;
  switch(chartType){
    case 'line':
      chartOptions.plotOptions = {
                                    line: {
                                      dataLabels: {
                                          enabled: true
                                      },
                                      enableMouseTracking: false
                                    }
                                  };
      break;
    case 'spline': ''
      break;
  }

  chart = new Highcharts.Chart(chartOptions);
};

$(document).ready(function(){
  $('#container').append('<div id="chart-sample"></div>');


  $('#chart_type').bind('change', function(){
    if ($(this).val().length > 0){
      renderChartByType();
    }
  });

});