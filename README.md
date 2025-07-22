# Mood-Based Music Recommendation System: From YouTube Comment Mining to Real-Time Personalized Discovery

A comprehensive multi-layer architecture combining Natural Language Processing (NLP), Unsupervised Learning (Clustering), and Adaptive Machine Learning (XGBoost) to provide real-time, mood-based music recommendations.

## 🎯 Project Overview

This system leverages YouTube comments from 2,000 songs, uses RoBERTa transformer models for emotion extraction, multi-metric K-means clustering for song categorization, cluster-based recommendation matching, and an XGBoost ensemble for continuous improvement.

**Live Application**: [http://my-music-env-optimized.eba-qwpd3pbm.us-west-2.elasticbeanstalk.com/](http://my-music-env-optimized.eba-qwpd3pbm.us-west-2.elasticbeanstalk.com/)

## 🏗️ Complete Pipeline Architecture

### **1. Data Collection & Preprocessing**
- **YouTube Comment Mining**: Scraped comments from 2,000 diverse songs across various genres
- **Comment Preprocessing**: Filtered spam, non-English, and low-quality comments
- **ROBERTa Processing**: Applied emotion classification to extract 11 mood dimensions per comment
- **Score Aggregation**: Averaged emotion scores across all comments per song
- **Quality Validation**: Verified strong correlations (e.g., Energetic-Workout: 0.99, Happy-Sad: -0.95)

### **2. Multi-Metric Clustering Analysis**
- **Five Validation Methods**: Elbow Method, Silhouette, Calinski-Harabasz, Davies-Bouldin, Gap Statistic
- **Optimal Clusters**: k=5 selected to balance statistical metrics with music domain expertise
- **Performance Metrics**:
  - Silhouette Score: 0.283 (meaningful cluster separation)
  - Calinski-Harabasz Index: 1,253.851 (strong inter-cluster separation)
  - Davies-Bouldin Index: 1.147 (near-optimal compactness)

### **3. Discovered Emotion-Based Clusters**
- **Cluster 0: "High-Energy Party"** (466 songs - 23%)
  - Triggers: energetic, workout, party, confidence boost
  - Profile: energetic (0.822), confident (0.803), workout (0.808), party (0.774)
- **Cluster 1: "Contemplative Study"** (371 songs - 19%)
  - Triggers: studying, focus, romantic mood, nostalgic
  - Profile: study (0.788), romantic (0.723), nostalgic (0.689)
- **Cluster 2: "Intense Energy"** (465 songs - 23%)
  - Triggers: angry, intense workout, aggressive mood
  - Profile: angry (0.784), energetic (0.772), workout (0.759)
- **Cluster 3: "Balanced Upbeat"** (479 songs - 24%)
  - Triggers: good mood, casual listening, moderate energy
  - Profile: happy (0.651), energetic (0.694), party (0.685)
- **Cluster 4: "Melancholic Focus"** (219 songs - 11%)
  - Triggers: sad, relaxing, quiet time, reflection
  - Profile: sad (0.766), relaxing (0.727), study (0.804)

## 🚀 Core ML Components

### **EnhancedMoodAnalyzer**
- **ROBERTa Transformer**: Fine-tuned for 11-dimensional emotion extraction
- **Fallback Strategy**: Keyword-based analysis when ML models fail
- **Real-time Processing**: Sub-10ms mood vector generation from user text

### **EnhancedMusicRecommender**
- **Hybrid Approach**: Content-based + collaborative filtering
- **Cluster-Based Matching**: O(5) cluster + O(400) song comparisons vs O(2000)
- **10x Performance Gain**: 200ms → 20ms response time
- **Similarity Search**: Cosine similarity within optimal clusters

### **XGBoostFeedbackEngine**
- **Adaptive Learning**: Continuous feedback integration
- **Personalization**: User preference learning from ratings
- **Regularization**: 42% validation error reduction
- **Minimum Feedback**: 3 points required for personalization

## 🎵 11-Dimensional Mood Analysis

The system extracts emotions across these dimensions:
- **Energetic** - High energy, upbeat, dynamic
- **Happy** - Positive, joyful, uplifting
- **Sad** - Melancholic, emotional, reflective
- **Relaxing** - Calm, peaceful, soothing
- **Party** - Social, celebratory, fun
- **Study** - Focus, concentration, academic
- **Nostalgic** - Reminiscent, sentimental, memory-evoking
- **Romantic** - Intimate, love, emotional connection
- **Angry** - Intense, aggressive, powerful
- **Confident** - Empowering, strong, self-assured
- **Workout** - Motivational, high-tempo, energetic

## 🏗️ Technical Architecture

### **Backend Stack**
- **Framework**: Flask (Python)
- **ML Libraries**: scikit-learn, XGBoost, sentence-transformers, torch
- **Data Processing**: pandas, numpy, nltk
- **Production Server**: Gunicorn

### **Frontend**
- **Templates**: HTML, CSS, JavaScript
- **User Interface**: Responsive design with real-time feedback
- **Spotify Integration**: Direct playlist creation and song links

### **Deployment & DevOps**
- **Cloud Platform**: AWS Elastic Beanstalk
- **Containerization**: Docker
- **CI/CD Pipeline**: GitHub Actions
- **Monitoring**: Health checks and performance metrics

## 📊 Performance Results

### **System Performance Metrics**
- **Cluster Assignment Accuracy**: 89% user satisfaction with primary cluster selection
- **Recommendation Speed**: 10x improvement (200ms → 20ms response time)
- **Personalization Quality**: 42% error reduction while maintaining mood relevance
- **Scalability**: O(k + cluster_size) complexity enables efficient scaling

### **XGBoost Model Performance**
- **Before Regularization**: Training MSE: 0.395, Validation MSE: 1.621, Test MAE: 1.015
- **After Regularization**: Training MSE: 0.654, Validation MSE: 0.940, Test MAE: 0.773
- **Improvement**: 42% validation error reduction through regularization

## 🚀 Live Application Features

### **User Experience Flow**
1. **Mood Input**: Natural language description of current emotional state
2. **Real-time Analysis**: 11-dimensional emotion vector extraction
3. **Cluster Matching**: Optimal cluster assignment (<10ms)
4. **Song Recommendations**: Personalized ranking within cluster
5. **Feedback Collection**: User ratings for continuous learning
6. **Spotify Integration**: Direct playlist creation and song links

### **API Endpoints**
- `GET /` - Main application interface
- `POST /recommend` - Generate mood-based recommendations
- `POST /feedback` - Submit user feedback for learning
- `GET /history` - View recommendation history
- `GET /spotify_playlist` - Create Spotify playlists
- `GET /health` - Health check endpoint

## 🛠️ Local Development

### **Prerequisites**
- Python 3.9+
- pip
- Git

### **Installation**
```bash
# Clone the repository
git clone https://github.com/Igosain08/music-recommendation-system-DS3-winning-project.git
cd music-recommendation-system-DS3-winning-project/Final\ app/final\ app/

# Install dependencies
pip install -r requirements.txt

# Run the application
python app.py
```

### **Testing**
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

## 🔧 Configuration

### **Environment Variables**
- `AWS_REGION`: us-west-2
- `EB_ENVIRONMENT`: my-music-env-optimized
- `EB_APPLICATION`: my-music-recommender

### **AWS Setup**
See `GITHUB_SETUP.md` for detailed AWS configuration instructions.

## 📈 CI/CD Pipeline

### **Automated Workflow**
- **Trigger**: Push to `main` branch
- **Testing**: pytest, flake8, black
- **Deployment**: Automatic AWS deployment
- **Verification**: Health checks and endpoint testing

### **Pipeline Stages**
1. **Testing**: Unit tests, linting, code formatting
2. **Building**: Docker image creation
3. **Deployment**: AWS Elastic Beanstalk deployment
4. **Health Checks**: Verify deployment success
5. **Notification**: Success/failure reporting

## 🎯 Key Innovations

### **1. Multi-Metric Clustering Validation**
- Ensures robust cluster selection beyond single-metric limitations
- Balances statistical metrics with music domain expertise
- Prevents overfitting through comprehensive validation

### **2. Real-time Emotion Extraction**
- Automated emotion labeling from large-scale comments
- Removes manual annotation requirements
- Provides psychologically consistent mood patterns

### **3. Cluster-Based Pre-filtering**
- 10x speedup through intelligent search space reduction
- Maintains recommendation quality while improving performance
- Enables sub-20ms recommendation latency

### **4. Adaptive Personalization**
- Combines similarity matching with learned user feedback
- Continuous improvement through XGBoost ensemble
- Balances mood relevance with user preferences

## 🔮 Future Directions

1. **Multi-modal Emotion Fusion**: Text, audio, and visual emotion analysis
2. **Cross-platform Integration**: Unified user profiles across platforms
3. **Mood-based Playlist Journeys**: Wellness-focused music experiences
4. **Real-time Audio Analysis**: Live emotion detection from music features

## 📄 Research Impact

This project demonstrates:
- **End-to-end ML Pipeline**: From data collection to production deployment
- **Advanced NLP Techniques**: Transformer-based emotion analysis
- **Scalable Architecture**: Efficient clustering and recommendation algorithms
- **Production Readiness**: CI/CD, monitoring, and cloud deployment
- **User-Centric Design**: Real-time personalization and feedback integration

## 🏆 Portfolio Value

Perfect for AI/ML internship applications, demonstrating:
- **Full-Stack Development**: Frontend, backend, ML, DevOps
- **Cloud Deployment**: AWS experience with automated CI/CD
- **ML Production**: Real-world ML system with monitoring
- **Research Skills**: Comprehensive data analysis and validation
- **Scalable Architecture**: Production-ready, enterprise-grade design

## 📞 Contact

For questions or collaboration opportunities, please reach out through the GitHub repository.

---

**This project represents a complete pipeline from user input to adaptive recommendations, showcasing advanced ML techniques in a production-ready music recommendation system.**
