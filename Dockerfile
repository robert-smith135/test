FROM cypress/browsers:chrome63-ff57

# Configure working directory
ADD ./ /usr/local/bbc
WORKDIR /usr/local/bbc/
