FROM python:3.9

# Set working directory
WORKDIR /app

# Install Selenium and required dependencies
RUN pip install selenium

# Install web driver for the desired browser (e.g., Chrome)
RUN apt-get update && apt-get install -y wget unzip
RUN wget https://chromedriver.storage.googleapis.com/{chrome_driver_version}/chromedriver_linux64.zip
RUN unzip chromedriver_linux64.zip
RUN mv chromedriver /usr/local/bin/

# Copy test scripts to the container
COPY tests /app/tests

# Set the entrypoint command
CMD ["python", "-m", "unittest", "discover", "tests"]
