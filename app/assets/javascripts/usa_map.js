// wrap this in a closure like below otherwise var variables are global
$(document).ready(function() {
  if ($(".map").length > 0) {
    var width = 650,
        height = 380;

    var projection = d3.geo.albersUsa()
        .scale(800)
        .translate([width / 2, height / 2])

    var svg = d3.select(".map").append("svg")
        .attr("width", width)
        .attr("height", height);

    var path = d3.geo.path()
        .projection(projection);

    var g = svg.append("g");

    <!-- load and display the World -->
    d3.json("json/usa_map.json", function(error, us) {
      g.selectAll("path")
        .data(us.features)
        .enter()
        .append("path")
        .attr("state", function(d) {
          return d.properties.NAME
        })
        .attr("d", path)
    });

    /* The below code will be coordinates obtained from using the geocoder gem to get
    long/lat of cities The code is : Geocoder.search(city)[0].data["geometry"]["location"]["lng"]*/

    var marks = [{long: -77, lat: 43},{long: -100, lat: 44},{long: -70, lat: 43}]

    svg.selectAll(".mark")
        .data(marks)
        .enter()
        .append("image")
        .attr('class','mark')
        .attr('width', 20)
        .attr('height', 20)
        .attr("xlink:href","red_pin.png")
        .attr("transform", function(d) {return "translate(" + projection([d.long,d.lat]) + ")";});
  }
});
