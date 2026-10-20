# Makefile for building LaTeX CV with Docker

.PHONY: build run clean shell help

# Default target
help:
	@echo "Available commands:"
	@echo "  make build  - Build the Docker image"
	@echo "  make run    - Compile the CV document"
	@echo "  make clean  - Remove output files"

build:
	docker build -t latex-cv .

run:
	@mkdir -p output
	docker run --rm \
		-v $(PWD):/cv \
		-v $(PWD)/output:/cv/output \
		latex-cv
	@if [ -d ../public ]; then cp output/cv.pdf ../public/cv.pdf; else echo "../public not found, skipping copy (PDF is in output/cv.pdf)"; fi

# Clean output
clean:
	rm -rf output/*