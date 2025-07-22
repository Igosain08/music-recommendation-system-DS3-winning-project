FROM python:3.11-slim

# Install system dependencies for ML libraries
RUN apt-get update && apt-get install -y \
    build-essential \
    gcc \
    g++ \
    libgomp1 \
    && rm -rf /var/lib/apt/lists/*

# Set work directory
WORKDIR /app

# Copy requirements and install with optimizations
COPY requirements.txt .

# Upgrade pip and install dependencies with optimizations
RUN pip install --upgrade pip
RUN pip install --no-cache-dir --prefer-binary -r requirements.txt
RUN pip install gunicorn

# Copy the rest of your app
COPY . .

# Download NLTK data
RUN python -m nltk.downloader punkt stopwords vader_lexicon

# Create user data directory
RUN mkdir -p user_data

# Expose port
EXPOSE 5000

# Set environment variable for Flask
ENV FLASK_APP=app.py
ENV PYTHONUNBUFFERED=1

# Use gunicorn for production
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "--workers", "1", "--timeout", "30", "app:app"] 