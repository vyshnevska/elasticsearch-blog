
// Global variables
var width = 260, height = 260;
var labelDistance = 0;
var nodes = [], labelAnchors = [], labelAnchorLinks = [], links = [];



$(document).ready(function(){
  // Fetch data
  d3.json("/articles/nodes_graph_data", function(data) {
    var chart = d3.select("#graph").attr("width", width).attr("height", height);

    prepareNodesData(data);
    render(chart);
  });
});


function prepareNodesData(data) {
  links = data.links;
  nodes = data.nodes;
  labelAnchorLinks = data.labelAnchorLinks;

  for(var i = 0; i < nodes.length; i++) {
    labelAnchors.push({
      node : nodes[i]
    });
    labelAnchors.push({
      node : nodes[i]
    });
  };
};

function prepareAllData(chart){
  var force = d3.layout.force().size([width, height]).nodes(nodes).links(links).gravity(1).linkDistance(50).charge(-3000).linkStrength(function(x) {
      return x.weight * 10
    });

  var force2 = d3.layout.force().nodes(labelAnchors).links(labelAnchorLinks).gravity(0).linkDistance(0).linkStrength(8).charge(-100).size([width, height]);

  var link = chart.selectAll("line.link")
              .data(links).enter().append("svg:line").attr("class", "link").style("stroke", "#CCC");

  var node = chart.selectAll("g.node").data(force.nodes()).enter().append("svg:g").attr("class", "node");

  return { force: force, force2: force2, link: link, node: node };
};

function render(chart) {
  var data = prepareAllData(chart);

  var force = data.force, force2 = data.force2,
      link = data.link, node = data.node;

  var color = d3.scale.category20(); // nodes color

  force.start();
  force2.start();

  node.append("svg:circle").attr("r", 5).style("fill", function(d) { return color(d.group); });

  node.call(force.drag);

  var anchorLink = chart.selectAll("line.anchorLink").data(labelAnchorLinks)

  var anchorNode = chart.selectAll("g.anchorNode").data(force2.nodes()).enter().append("svg:g").attr("class", "anchorNode");

  anchorNode.append("svg:circle").attr("r", 0).style("fill", "#FFF");
    anchorNode.append("svg:text").text(function(d, i) {
    return i % 2 == 0 ? "" : d.node.label
  }).style("fill", "#555").style("font-family", "Arial").style("font-size", 12);

  drawNodes(force, force2, node, anchorNode, anchorLink, link);
};

var updateLink = function() {
  this.attr("x1", function(d) {
    return d.source.x;
  }).attr("y1", function(d) {
    return d.source.y;
  }).attr("x2", function(d) {
    return d.target.x;
  }).attr("y2", function(d) {
    return d.target.y;
  });
}

var updateNode = function() {
  this.attr("transform", function(d) {
    return "translate(" + d.x + "," + d.y + ")";
  });
}

function drawNodes(force, force2, node, anchorNode, anchorLink, link) {
  force.on("tick", function() {

      force2.start();

      // draw bold black node dot
      node.call(updateNode);

      anchorNode.each(function(d, i) {
        if(i % 2 == 0) {
          d.x = d.node.x;
          d.y = d.node.y;
        } else {
          var b = this.childNodes[1].getBBox();

          var diffX = d.x - d.node.x;
          var diffY = d.y - d.node.y;

          var dist = Math.sqrt(diffX * diffX + diffY * diffY);

          var shiftX = b.width * (diffX - dist) / (dist * 2);
          shiftX = Math.max(-b.width, Math.min(0, shiftX));
          var shiftY = 5;
          this.childNodes[1].setAttribute("transform", "translate(" + shiftX + "," + shiftY + ")");
        }
      });

      // set node name
      anchorNode.call(updateNode);

      // draw nodes links
      link.call(updateLink);
      anchorLink.call(updateLink);

    });
  };

