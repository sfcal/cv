# Use a TeXLive base image with full installation
FROM texlive/texlive:latest

# Install additional system dependencies and fonts
RUN apt-get update && apt-get install -y \
    wget \
    git \
    make \
    fontconfig \
    fonts-roboto \
    fonts-font-awesome \
    && rm -rf /var/lib/apt/lists/*

# Update font cache
RUN fc-cache -fv

# Set working directory
WORKDIR /cv

# Copy all CV files
COPY . ./

# Create output directory
RUN mkdir -p output

# Default command to compile the CV
CMD ["xelatex", "-output-directory=output", "cv.tex"]