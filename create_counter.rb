!#/usr/bin/env ruby

require 'nokogiri'

# First step is creating the NATO symbol:
# - Find the center of the grid horizontally and vertically.
# - Define aspect ratio of enclosing box
# - Determine width by desired proportion
# - Scale height according to aspect ratio
# 
#
# The NATO symbol draws only the box and contents.
#  - width: width of the box itself
#  - height: height of the box itself
#  - type: type of symbol to draw
class NatoSymbol
  attr_accessor :width, :height, :type

  def initialize(width, height, type)
    @width = width
    @height = height
    @type = type
  end

  def box(doc)
  end
end