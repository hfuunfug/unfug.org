all:
	bundle exec nanoc

view: all
	bundle exec nanoc view

weekly-update:
	rm output/index.html
	rm output/talks/index.html
	bundle exec nanoc

