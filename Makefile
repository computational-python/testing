index.html: talk.md talk.css
	python refreeze/freeze.py
	perl -pi -e 's;img/;/testing/img/;' index.html

test:
	#python -m nose -vx --with-doctest --doctest-extension=md talk.md
	python -m pytest --doctest-glob="*.md"


RANDOM_PORT=`python -c 'import random; print(int(5000+ 5000*random.random()))'`

slideshow:
	PORT=$(RANDOM_PORT) python refreeze/flask_app.py
show:
	python refreeze/open_static.py
