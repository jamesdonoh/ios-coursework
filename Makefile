default: proposal.pdf

proposal.pdf: proposal.md bibliography.yaml
	pandoc --filter pandoc-citeproc \
		--csl harvard-greenwich.csl \
		--bibliography=bibliography.yaml \
		--latex-engine=xelatex \
		-V geometry:a4paper \
		-V mainfont=Constantia \
		-V colorlinks \
		-s -o $@ $<

clean:
	rm -f proposal.{html,pdf}
