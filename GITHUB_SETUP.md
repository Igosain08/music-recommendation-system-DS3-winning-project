# GitHub CI/CD Setup Guide

## Required GitHub Secrets

To enable automated deployment, you need to add the following secrets to your GitHub repository:

### 1. Go to GitHub Repository Settings
- Navigate to your repository on GitHub
- Click on "Settings" tab
- Click on "Secrets and variables" → "Actions"

### 2. Add AWS Credentials

#### AWS_ACCESS_KEY_ID
- **Name**: `AWS_ACCESS_KEY_ID`
- **Value**: Your AWS Access Key ID
- **How to get it**:
  1. Go to AWS Console → IAM
  2. Create a new user or use existing one
  3. Attach policy: `AWSElasticBeanstalkFullAccess`
  4. Create Access Key
  5. Copy the Access Key ID

#### AWS_SECRET_ACCESS_KEY
- **Name**: `AWS_SECRET_ACCESS_KEY`
- **Value**: Your AWS Secret Access Key
- **How to get it**:
  1. Same as above, but copy the Secret Access Key
  2. **Important**: Keep this secret and never commit it to code

### 3. IAM Policy Requirements

The AWS user needs the following permissions:
```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "elasticbeanstalk:*",
                "ec2:*",
                "ecs:*",
                "ecr:*",
                "elasticloadbalancing:*",
                "autoscaling:*",
                "cloudwatch:*",
                "s3:*",
                "sns:*",
                "cloudformation:*",
                "rds:*",
                "sqs:*",
                "logs:*"
            ],
            "Resource": "*"
        }
    ]
}
```

### 4. Test the Setup

After adding the secrets:
1. Make a small change to your code
2. Push to the `main` branch
3. Go to "Actions" tab in GitHub
4. Watch the CI/CD pipeline run

### 5. Pipeline Stages

The pipeline includes:
- **Testing**: Unit tests, linting, code formatting
- **Building**: Docker image creation
- **Deployment**: AWS Elastic Beanstalk deployment
- **Health Checks**: Verify deployment success
- **Notification**: Success/failure reporting

### 6. Troubleshooting

If deployment fails:
1. Check the "Actions" tab for detailed logs
2. Verify AWS credentials are correct
3. Ensure Elastic Beanstalk environment exists
4. Check that all required files are committed

### 7. Security Best Practices

- Use IAM roles with minimal required permissions
- Rotate access keys regularly
- Never commit secrets to code
- Use environment-specific configurations 