#!/usr/bin/env ruby

#!/usr/bin/env ruby
require 'nokogiri'

class Grid
  attr_accessor :width, :height, :spacing

  def initialize(width, height, spacing)
    @width = width
    @height = height
    @spacing = spacing
  end

  def generate_vertical_gridlines(doc)
    doc.g(id: 'vertical-lines') do
      # Vertical lines
      (0..@width).step(@spacing) do |x|
        doc.line(x1: x, y1: 0, x2: x, y2: @height, style: 'stroke:lightblue;stroke-width:1')
      end
    end
  end

  def generate_horizontal_gridlines(doc)
    doc.g(id: 'horizontal-lines') do
      # Horizontal lines
      (0..@height).step(@spacing) do |y|
        doc.line(x1: 0, y1: y, x2: @width, y2: y, style: 'stroke:lightblue;stroke-width:1')
      end
    end
  end

  def save_svg(filename)
    builder = Nokogiri::XML::Builder.new do |xml|
      xml.svg(xmlns: 'http://www.w3.org/2000/svg', width: @width, height: @height) do
        xml.g(id: 'gridlines') do
          generate_vertical_gridlines(xml)
          generate_horizontal_gridlines(xml)
        end
      end
    end

    File.write(filename, builder.to_xml)
  end
end

# Example usage
grid = Grid.new(1280, 1280, 20)
grid.save_svg('next-war-taiwan/grid_1280.svg')

