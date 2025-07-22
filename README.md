# AI-Powered Music Recommendation System

A sophisticated music recommendation system that uses machine learning to provide personalized song suggestions based on user mood and preferences.

## 🚀 Features

- **Mood-Based Recommendations**: Analyzes user text input to understand emotional state
- **Personalized Learning**: Uses XGBoost to learn from user feedback
- **Spotify Integration**: Create playlists directly on Spotify
- **Real-time ML**: Advanced NLP with sentence-transformers
- **Production Ready**: Deployed on AWS with CI/CD pipeline

## 🏗️ Architecture

### Tech Stack
- **Backend**: Flask (Python)
- **ML Libraries**: scikit-learn, XGBoost, sentence-transformers
- **Frontend**: HTML, CSS, JavaScript
- **Database**: Local storage (S3 ready)
- **Deployment**: AWS Elastic Beanstalk
- **CI/CD**: GitHub Actions

### ML Pipeline
```
User Input → NLP Analysis → Mood Extraction → Song Matching → 
Recommendation → User Feedback → Model Learning → Improved Suggestions
```

## 🚀 Deployment

### Live Application
**URL**: http://my-music-env-optimized.eba-qwpd3pbm.us-west-2.elasticbeanstalk.com/

### CI/CD Pipeline
This project uses GitHub Actions for automated testing and deployment:

#### Pipeline Stages:
1. **Testing**: Unit tests, linting, code formatting
2. **Building**: Docker image creation
3. **Deployment**: AWS Elastic Beanstalk deployment
4. **Health Checks**: Verify deployment success
5. **Notification**: Success/failure reporting

#### Automated Workflow:
- **Trigger**: Push to `main` branch
- **Testing**: pytest, flake8, black
- **Deployment**: Automatic AWS deployment
- **Verification**: Health checks and endpoint testing

## 🛠️ Local Development

### Prerequisites
- Python 3.9+
- pip
- Git

### Installation
```bash
# Clone the repository
git clone <your-repo-url>
cd "Final app/final app"

# Install dependencies
pip install -r requirements.txt

# Run the application
python app.py
```

### Testing
```bash
# Run all tests
pytest

# Run with coverage
pytest --cov=app

# Run linting
flake8 .

# Format code
black .
```

## 📊 ML Components

### 1. EnhancedMoodAnalyzer
- Uses sentence-transformers for advanced NLP
- Fallback to keyword-based analysis
- Extracts mood from natural language input

### 2. EnhancedMusicRecommender
- Hybrid recommendation system
- Content-based + collaborative filtering
- Clustering-based similarity search

### 3. XGBoostFeedbackEngine
- Learns from user feedback
- Personalizes recommendations
- Requires minimum 5 feedback points

## 🔧 Configuration

### Environment Variables
- `AWS_REGION`: us-west-2
- `EB_ENVIRONMENT`: my-music-env-optimized
- `EB_APPLICATION`: my-music-recommender

### AWS Setup
See `GITHUB_SETUP.md` for detailed AWS configuration instructions.

## 📈 Performance

### Optimization Features:
- **Caching**: Static files cached for 1 year
- **Lazy Loading**: ML models loaded on first use
- **Fallback Systems**: Multiple fallback strategies
- **Health Monitoring**: Continuous health checks

### Scalability:
- **Docker Containerization**: Consistent deployment
- **Stateless Design**: Horizontal scaling ready
- **Database Ready**: Easy migration to cloud databases

## 🧪 Testing

### Test Coverage
- **Unit Tests**: Core functionality testing
- **Integration Tests**: End-to-end workflow testing
- **Health Checks**: Deployment verification
- **Code Quality**: Linting and formatting

### Running Tests
```bash
# Run all tests
pytest

# Run specific test file
pytest test_app.py

# Run with verbose output
pytest -v

# Generate coverage report
pytest --cov=app --cov-report=html
```

## 🔒 Security

### Best Practices:
- **IAM Roles**: Minimal required permissions
- **Secret Management**: GitHub Secrets for AWS credentials
- **HTTPS**: SSL/TLS encryption
- **Input Validation**: Sanitized user inputs

## 📝 API Endpoints

### Health & Testing
- `GET /health` - Health check endpoint
- `GET /ping` - Simple ping endpoint
- `GET /test` - Application status

### User Management
- `GET /login` - Login page
- `POST /login` - User authentication
- `GET /register` - Registration page
- `POST /register` - User registration
- `GET /logout` - User logout

### Core Features
- `GET /` - Main application interface
- `POST /recommend` - Generate recommendations
- `POST /feedback` - Submit user feedback
- `GET /history` - View recommendation history
- `GET /spotify_playlist` - Create Spotify playlist

## 🚀 Deployment Process

### Manual Deployment
```bash
# Deploy to AWS Elastic Beanstalk
eb deploy
```

### Automated Deployment
1. Push code to `main` branch
2. GitHub Actions automatically:
   - Runs tests
   - Builds Docker image
   - Deploys to AWS
   - Verifies deployment

## 📊 Monitoring

### Health Checks
- **Application Health**: `/health` endpoint
- **AWS Monitoring**: Elastic Beanstalk health
- **Performance Metrics**: Response times, error rates

### Logs
- **Application Logs**: Flask application logs
- **AWS Logs**: Elastic Beanstalk logs
- **CI/CD Logs**: GitHub Actions logs

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests for new features
5. Ensure all tests pass
6. Submit a pull request

## 📄 License

This project is for educational and portfolio purposes.

## 🎯 Portfolio Impact

This project demonstrates:
- **Full-Stack Development**: Frontend, backend, ML, DevOps
- **Cloud Deployment**: AWS experience
- **ML Production**: Real-world ML system
- **CI/CD Pipeline**: Automated testing and deployment
- **Scalable Architecture**: Production-ready design

Perfect for AI/ML internship applications! 