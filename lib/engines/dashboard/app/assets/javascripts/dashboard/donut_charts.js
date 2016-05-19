$(function() {
    // Create the chart 1
    chart1 = new Highcharts.Chart({
        chart: {
            renderTo: 'donut_chart#0',
            margin: [0, 0, 0, 0],
            backgroundColor: null,
            plotBackgroundColor: 'none',

        },

        title: {
            text: null
        },

        tooltip: {
            formatter: function() {
                return this.point.name +': '+ this.y +' %';

            }
        },
        series: [
            {
            borderWidth: 2,
            borderColor: '#F1F3EB',
            shadow: false,
            type: 'pie',
            name: 'Income',
            innerSize: '65%',
            data: [
                { name: 'load percentage', y: 45.0, color: '#b2c831' },
                { name: 'rest', y: 55.0, color: '#3d3d3d' }
            ],
            dataLabels: {
                enabled: false,
                color: '#000000',
                connectorColor: '#000000'
            }
        }]
    });
    // Create the chart 2
    chart2 = new Highcharts.Chart({
        chart: {
            renderTo: 'donut_chart#2',
            margin: [0, 0, 0, 0],
            backgroundColor: null,
            plotBackgroundColor: 'none',

        },

        title: {
            text: null
        },

        tooltip: {
            formatter: function() {
                return this.point.name +': '+ this.y +' %';

            }
        },
        series: [
            {
            borderWidth: 2,
            borderColor: '#F1F3EB',
            shadow: false,
            type: 'pie',
            name: 'SiteInfo',
            innerSize: '65%',
            data: [
                { name: 'Used', y: 65.0, color: '#fa1d2d' },
                { name: 'Rest', y: 35.0, color: '#3d3d3d' }
            ],
            dataLabels: {
                enabled: false,
                color: '#000000',
                connectorColor: '#000000'
            }
        }]
    });
});
