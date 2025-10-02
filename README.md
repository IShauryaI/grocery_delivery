# Grocery Delivery System 🛒

**A comprehensive Django-based grocery delivery platform with real-time order management, secure payments, and intuitive admin controls for seamless online grocery shopping experience.**

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![Last Commit](https://img.shields.io/github/last-commit/IShauryaI/grocery_delivery)](https://github.com/IShauryaI/grocery_delivery/commits/main)
[![Issues](https://img.shields.io/github/issues/IShauryaI/grocery_delivery)](https://github.com/IShauryaI/grocery_delivery/issues)
[![Django](https://img.shields.io/badge/Django-4.0.2-green.svg)](https://djangoproject.com)
[![Python](https://img.shields.io/badge/Python-3.8%2B-blue.svg)](https://python.org)

## 📋 Project Overview

This Grocery Delivery System revolutionizes online grocery shopping by providing a comprehensive platform that connects customers with local stores for seamless home delivery. Built with Django and modern web technologies, it offers real-time inventory management, secure payment processing, and an intuitive user experience across multiple user roles.

The platform serves three distinct user types: **Customers** who can browse products and place orders, **Store Administrators** who manage inventory and fulfill orders, and **System Administrators** who oversee the entire platform. With features like real-time order tracking, secure payment integration via Razorpay, and responsive design, this application ensures an efficient grocery delivery experience.

## ✨ Key Features

- **Multi-User Authentication System** - Separate dashboards for customers, store admins, and system administrators
- **Advanced Product Catalog** - Comprehensive categorization with high-quality images and detailed descriptions
- **Real-Time Order Management** - Complete order lifecycle from cart to delivery
- **Secure Payment Processing** - Integrated Razorpay payment gateway for safe transactions
- **Inventory Management System** - Real-time stock tracking with low inventory alerts
- **Responsive Design** - Mobile-first approach with Bootstrap framework
- **Admin Control Panel** - Comprehensive backend management for products, orders, and users
- **Email Notifications** - Automated order confirmations and status updates
- **Shopping Cart Functionality** - Persistent cart with quantity management
- **Order History Tracking** - Complete purchase history for customers
- **Search and Filter System** - Advanced product discovery capabilities

## 🛠️ Tech Stack

### Backend
- **Python 3.8+** - Core programming language
- **Django 4.0.2** - High-level Python web framework
- **MySQL** - Primary database with PyMySQL connector
- **SQLite** - Development database (included)

### Frontend
- **HTML5** - Semantic markup structure
- **CSS3** - Modern styling with responsive design
- **JavaScript (ES6+)** - Dynamic client-side functionality
- **Bootstrap** - Responsive UI framework
- **Django Crispy Forms** - Enhanced form rendering

### Payment & External Services
- **Razorpay** - Secure payment gateway integration
- **Pillow** - Image processing and handling
- **Email Backend** - SMTP-based notification system

### Development Tools
- **Django Debug Toolbar** - Development debugging
- **PyCharm** - Integrated development environment
- **Git** - Version control system

## 📁 Current Project Structure

```
grocery_delivery/
├── client/                     # Client-side templates and static files
│   ├── templates/
│   ├── static/
│   └── views/
├── grocery_delivery/           # Main Django project directory
│   ├── __init__.py
│   ├── settings.py
│   ├── urls.py
│   └── wsgi.py
├── store/                      # Core store application
│   ├── models.py
│   ├── views.py
│   ├── admin.py
│   ├── urls.py
│   └── migrations/
├── templates/                  # Global templates
│   ├── base.html
│   ├── store/
│   └── admin/
├── static/                     # Static files (CSS, JS, Images)
│   ├── css/
│   ├── js/
│   ├── images/
│   └── vendor/
├── DataBase/                   # Database exports and schemas
├── db.sqlite3                  # SQLite database file
├── manage.py                   # Django management script
├── mailDemo.py                 # Email configuration demo
└── requirements.txt            # Python dependencies
```

## 🚀 Setup & Installation

### Prerequisites
- Python 3.8 or higher
- MySQL 8.0 or higher (for production)
- Git
- Virtual environment (recommended)

### Local Development Setup

1. **Clone the repository**
   ```bash
   git clone https://github.com/IShauryaI/grocery_delivery.git
   cd grocery_delivery
   ```

2. **Create and activate virtual environment**
   ```bash
   python -m venv grocery_env
   source grocery_env/bin/activate  # On Windows: grocery_env\Scripts\activate
   ```

3. **Install dependencies**
   ```bash
   pip install -r requirements.txt
   ```

4. **Configure database**
   ```bash
   # For development (SQLite - already configured)
   python manage.py migrate
   
   # For production (MySQL)
   # Update DATABASES setting in settings.py with your MySQL credentials
   python manage.py migrate
   ```

5. **Create superuser**
   ```bash
   python manage.py createsuperuser
   ```

6. **Load sample data** (optional)
   ```bash
   python manage.py loaddata DataBase/sample_data.json  # If available
   ```

7. **Run development server**
   ```bash
   python manage.py runserver
   ```

   Visit `http://127.0.0.1:8000` to view the application.

## 🌐 Deployment Methodologies

### Docker & Docker Compose

**Quick Start with Docker:**
```bash
# Build and run with docker-compose
docker-compose up --build

# Run in detached mode
docker-compose up -d

# View logs
docker-compose logs -f
```

**Production Docker Setup:**
```bash
# Build production image
docker build -t grocery-delivery:latest -f deployment/docker/Dockerfile.prod .

# Run with production settings
docker run -d -p 8000:8000 --env-file .env.prod grocery-delivery:latest
```

### Cloud Deployment

#### AWS Deployment
- **EC2 + RDS**: Traditional cloud hosting with managed MySQL
- **Elastic Beanstalk**: Platform-as-a-Service deployment
- **ECS + Fargate**: Containerized deployment with orchestration

#### Heroku Deployment
```bash
# Install Heroku CLI and login
heroku login

# Create Heroku app
heroku create grocery-delivery-app

# Set environment variables
heroku config:set DEBUG=False
heroku config:set SECRET_KEY=your_secret_key
heroku config:set DATABASE_URL=your_database_url

# Deploy
git push heroku main
```

#### Digital Ocean Deployment
- Configure droplet with Ubuntu 20.04
- Set up Nginx reverse proxy
- Configure SSL with Let's Encrypt
- Use Gunicorn for WSGI server

### CI/CD Pipeline

[![Build Status](https://github.com/IShauryaI/grocery_delivery/workflows/CI/badge.svg)](https://github.com/IShauryaI/grocery_delivery/actions)

**GitHub Actions Workflow:** [`.github/workflows/ci-cd.yml`](.github/workflows/ci-cd.yml)

- Automated testing on pull requests
- Code quality checks with linting
- Security vulnerability scanning
- Automated deployment to staging/production environments

## 💻 Usage & Run Commands

### Development Mode
```bash
# Start development server
python manage.py runserver

# Run with custom port
python manage.py runserver 0.0.0.0:8080

# Run tests
python manage.py test

# Create database migrations
python manage.py makemigrations

# Apply migrations
python manage.py migrate

# Collect static files
python manage.py collectstatic

# Create superuser
python manage.py createsuperuser

# Access Django shell
python manage.py shell
```

### Production Mode
```bash
# Start with Gunicorn
gunicorn --bind 0.0.0.0:8000 grocery_delivery.wsgi:application

# With workers and timeout
gunicorn --workers 4 --timeout 300 --bind 0.0.0.0:8000 grocery_delivery.wsgi:application

# Background process with logs
nohup gunicorn --bind 0.0.0.0:8000 grocery_delivery.wsgi:application > app.log 2>&1 &
```

### Database Management
```bash
# Create database backup
python manage.py dumpdata > backup.json

# Restore from backup
python manage.py loaddata backup.json

# Reset database
python manage.py flush

# Show database migrations
python manage.py showmigrations
```

## 📸 Screenshots & Demo

### Application Homepage
![Homepage Screenshot](assets/screenshots/homepage.png)

### Product Catalog
![Product Catalog](assets/screenshots/product-catalog.png)

### Shopping Cart
![Shopping Cart](assets/screenshots/shopping-cart.png)

### Admin Dashboard
![Admin Dashboard](assets/screenshots/admin-dashboard.png)

### Order Management
![Order Management](assets/screenshots/order-management.png)

> **Live Demo**: [Coming Soon] - A fully functional demo will be available soon

## 🗺️ Roadmap & TODO

### Phase 1 - Core Features ✅
- [x] User authentication and registration
- [x] Product catalog with categories
- [x] Shopping cart functionality
- [x] Order processing system
- [x] Payment gateway integration (Razorpay)
- [x] Admin panel for product management
- [x] Email notification system

### Phase 2 - Enhanced Features 🚧
- [ ] Real-time order tracking
- [ ] Advanced search and filtering
- [ ] Wishlist functionality
- [ ] Multiple payment gateways
- [ ] Inventory alerts and management
- [ ] Customer review and rating system
- [ ] Promotional codes and discounts

### Phase 3 - Advanced Features 📋
- [ ] Mobile application (React Native/Flutter)
- [ ] AI-powered product recommendations
- [ ] Voice search integration
- [ ] Multi-language support
- [ ] Advanced analytics dashboard
- [ ] API rate limiting and throttling
- [ ] GraphQL API implementation
- [ ] Real-time chat support

### Phase 4 - Scalability & Performance 🎯
- [ ] Microservices architecture
- [ ] Redis caching implementation
- [ ] CDN integration for static files
- [ ] Load balancing setup
- [ ] Advanced monitoring and logging
- [ ] Automated backup systems
- [ ] Performance optimization

## 🔧 Configuration

### Environment Variables
Create a `.env` file in the root directory:

```env
SECRET_KEY=your-secret-key-here
DEBUG=True
DATABASE_NAME=grocery_delivery_db
DATABASE_USER=your_username
DATABASE_PASSWORD=your_password
DATABASE_HOST=localhost
DATABASE_PORT=3306
RAZORPAY_KEY_ID=your_razorpay_key
RAZORPAY_KEY_SECRET=your_razorpay_secret
EMAIL_HOST_USER=your_email@gmail.com
EMAIL_HOST_PASSWORD=your_email_password
```

### Payment Gateway Setup
1. Create a Razorpay account at [razorpay.com](https://razorpay.com)
2. Get your API keys from the dashboard
3. Add the keys to your environment variables
4. Test the integration with Razorpay's test mode

## 🤝 Contributing

We welcome contributions to improve the Grocery Delivery System! Here's how you can help:

1. **Fork the repository**
2. **Create a feature branch** (`git checkout -b feature/AmazingFeature`)
3. **Commit your changes** (`git commit -m 'Add some AmazingFeature'`)
4. **Push to the branch** (`git push origin feature/AmazingFeature`)
5. **Open a Pull Request**

### Development Guidelines
- Follow PEP 8 style guidelines
- Write unit tests for new features
- Update documentation for significant changes
- Ensure backwards compatibility

## 📄 License & Acknowledgments

### License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

### Acknowledgments
- **VMM Education** - For providing the training environment and project guidance
- **Dr. Munish Saini** - Project supervisor and technical mentor
- **Django Community** - For the robust web framework and extensive documentation
- **Bootstrap Team** - For the responsive UI components
- **Razorpay** - For secure payment processing solutions
- **Contributors** - All developers who contribute to improving this project

### Academic Context
This project was developed as part of an Industrial Training program and Bachelor of Technology (B.Tech) degree in Computer Science at Guru Nanak Dev University, Amritsar, under the supervision of the Department of Computer Engineering and Technology.

### Third-Party Libraries
- **Django** - BSD License
- **Bootstrap** - MIT License
- **Razorpay Python SDK** - MIT License
- **Pillow** - PIL Software License
- **PyMySQL** - MIT License

---

**Built with ❤️ by [Shaurya Parshad](https://github.com/IShauryaI)**

*For questions, suggestions, or contributions, please feel free to [open an issue](https://github.com/IShauryaI/grocery_delivery/issues) or submit a pull request.*

### 🔗 Useful Links
- [Django Documentation](https://docs.djangoproject.com/)
- [Razorpay Integration Guide](https://razorpay.com/docs/)
- [Bootstrap Documentation](https://getbootstrap.com/docs/)
- [MySQL Documentation](https://dev.mysql.com/doc/)