#!/usr/bin/env ruby

class Grid
  attr_accessor :width, :height, :spacing

  def initialize(width, height, spacing)
    @width = width
    @height = height
    @spacing = spacing
  end

  def generate_gridlines
    lines = ""

    # Vertical lines
    (0..@width).step(@spacing) do |x|
      lines += %Q(<line x1="#{x}" y1="0" x2="#{x}" y2="#{height}" style="stroke:lightblue;stroke-width:1"/>\n)
    end

    # Horizontal lines
    (0..@height).step(@spacing) do |y|
      lines += %Q(<line x1="0" y1="#{y}" x2="#{width}" y2="#{y}" style="stroke:lightblue;stroke-width:1"/>\n)
    end

    lines
  end

  def save_svg(filename)
    File.open(filename, 'w') do |file|
      file.puts "<svg xmlns='http://www.w3.org/2000/svg' width='#{@width}' height='#{@height}'>"
      file.puts generate_gridlines
      file.puts "</svg>"
    end
  end
end

# Example usage
grid = Grid.new(1280, 1280, 20)
grid.save_svg('grid.svg')

