#!/usr/bin/env ruby

require 'zurb-foundation'

http_path ="/"
css_dir = "output/assets"
images_dir = "content/assets/images"
javascripts_dir = "content/assets/javascripts"
sass_dir = "content/assets/stylesheets"

# -----------------------------------------------
# Output
# -----------------------------------------------

output_style = :compressed
preferred_syntax = :scss
relative_assets = true
