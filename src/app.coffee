define [
  "d3"
], (d3)->
  class App

    defaults:
      width: 200
      height:
        top: 15
        margin: 2
        bottom: 40
      facetes: 90

    constructor: ->
      @data = @defaults
      @initUi()
      @render()


    initUi: ->
      @ui =
        test: "0"

    update: ->
      @data = []

    render: ->
      width = 1200
      height = 800
      @svg = d3
        .select "body"
        .append "svg"
        .attr "width", width
        .attr "height", height
        .append "g"
        .attr "transform", "translate(#{width/2},#{height/2})"
        .data @defaults
        .enter()
          .append "circle"



