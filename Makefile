all:
	cabal run rebuild
	cabal run watch

clean:
	rm -rf *.hi *.o .*.swp .*.swo site _site/ _cache/ _build/*
