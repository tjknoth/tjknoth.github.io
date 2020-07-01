all:
	stack build
	stack exec site build
	stack exec site watch

clean:
	rm -rf *.hi *.o .*.swp .*.swo site _site/ _cache/ _build/*
