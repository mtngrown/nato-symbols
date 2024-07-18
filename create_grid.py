#!/usr/bin/env python3
# This Python script creates an SVG file with a grid of light blue lines spaced 10 units apart.

from lxml import etree

class Grid:
    def __init__(self, width, height, spacing):
        self.width = width
        self.height = height
        self.spacing = spacing

    def generate_gridlines(self):
        # Create the root SVG element
        svg = etree.Element("svg", xmlns="http://www.w3.org/2000/svg", width=str(self.width), height=str(self.height))
        
        # Vertical lines
        for x in range(0, self.width + 1, self.spacing):
            etree.SubElement(svg, "line", {
                'x1': str(x), 'y1': '0', 'x2': str(x), 'y2': str(self.height),
                'style': 'stroke:lightblue;stroke-width:1'
            })

        # Horizontal lines
        for y in range(0, self.height + 1, self.spacing):
            etree.SubElement(svg, "line", {
                'x1': '0', 'y1': str(y), 'x2': str(self.width), 'y2': str(y),
                'style': 'stroke:lightblue;stroke-width:1'
            })

        return etree.tostring(svg, pretty_print=True).decode()

    def save_svg(self, filename):
        with open(filename, 'w') as file:
            file.write(self.generate_gridlines())

def main():
    grid = Grid(640, 640, 10)
    grid.save_svg('pygrid.svg')
    print("SVG file has been created with a grid.")

if __name__ == "__main__":
    main()

