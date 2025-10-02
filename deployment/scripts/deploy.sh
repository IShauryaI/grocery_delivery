#!/bin/bash

# Deployment script for Grocery Delivery System
# Usage: ./deploy.sh [environment] [branch]

set -e

ENVIRONMENT=${1:-staging}
BRANCH=${2:-main}

echo "=========================================="
echo "Deploying Grocery Delivery System"
echo "Environment: $ENVIRONMENT"
echo "Branch: $BRANCH"
echo "=========================================="

# Configuration
APP_NAME="grocery_delivery"
APP_DIR="/var/www/$APP_NAME"
BACKUP_DIR="/var/backups/$APP_NAME"
LOG_FILE="/var/log/$APP_NAME/deploy.log"

# Create directories if they don't exist
sudo mkdir -p $APP_DIR $BACKUP_DIR $(dirname $LOG_FILE)
sudo chown -R $USER:$USER $APP_DIR $BACKUP_DIR $(dirname $LOG_FILE)

log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a $LOG_FILE
}

log "Starting deployment..."

# Backup current version
if [ -d "$APP_DIR/.git" ]; then
    log "Creating backup..."
    sudo cp -r $APP_DIR $BACKUP_DIR/backup_$(date +%Y%m%d_%H%M%S)
fi

# Pull latest code
log "Pulling latest code from $BRANCH branch..."
cd $APP_DIR
git fetch origin
git checkout $BRANCH
git pull origin $BRANCH

# Install/update dependencies
log "Installing Python dependencies..."
source venv/bin/activate || python3 -m venv venv && source venv/bin/activate
pip install -r requirements.txt

# Run database migrations
log "Running database migrations..."
python manage.py migrate --noinput

# Collect static files
log "Collecting static files..."
python manage.py collectstatic --noinput

# Restart services based on environment
if [ "$ENVIRONMENT" = "production" ]; then
    log "Restarting production services..."
    
    # Using Docker Compose
    if [ -f "docker-compose.prod.yml" ]; then
        docker-compose -f docker-compose.prod.yml down
        docker-compose -f docker-compose.prod.yml up -d --build
    else
        # Using systemd services
        sudo systemctl restart gunicorn
        sudo systemctl restart nginx
    fi
    
    log "Production deployment completed!"
    
elif [ "$ENVIRONMENT" = "staging" ]; then
    log "Restarting staging services..."
    
    # Kill existing development server if running
    pkill -f "manage.py runserver" || true
    
    # Start development server in background
    nohup python manage.py runserver 0.0.0.0:8000 > /dev/null 2>&1 &
    
    log "Staging deployment completed!"
    
else
    log "Unknown environment: $ENVIRONMENT"
    exit 1
fi

# Health check
log "Performing health check..."
sleep 5

if [ "$ENVIRONMENT" = "production" ]; then
    HEALTH_URL="https://localhost/health/"
else
    HEALTH_URL="http://localhost:8000/"
fi

if curl -f $HEALTH_URL > /dev/null 2>&1; then
    log "Health check passed!"
else
    log "WARNING: Health check failed!"
fi

log "Deployment completed successfully!"
log "Application is running at: $HEALTH_URL"

echo "=========================================="
echo "Deployment Summary:"
echo "Environment: $ENVIRONMENT"
echo "Branch: $BRANCH"
echo "Timestamp: $(date)"
echo "Status: SUCCESS"
echo "=========================================="