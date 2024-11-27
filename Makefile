all:

check: tmp/check-done

clean:
	rm -rf tmp/

.gitignore:
	printf 'tmp/\n' > $@

README:
	printf "# $$(basename $$(pwd))\n\n" > $@

tmp:
	mkdir $@

tmp/check-done: .gitignore README flake.lock flake.nix tmp
	nix fmt
	nix flake check
	touch $@
