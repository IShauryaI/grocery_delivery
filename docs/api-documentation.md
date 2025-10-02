# API Documentation - Grocery Delivery System

## Overview

This document provides comprehensive API documentation for the Grocery Delivery System. The APIs follow RESTful principles and return JSON responses.

## Base URL

```
Development: http://localhost:8000/api/
Production: https://your-domain.com/api/
```

## Authentication

The API uses session-based authentication for most endpoints. Some endpoints may require specific user roles.

### Login
```http
POST /api/auth/login/
Content-Type: application/json

{
    "username": "user@example.com",
    "password": "password123"
}
```

### Logout
```http
POST /api/auth/logout/
```

## Products API

### List Products
```http
GET /api/products/
```

**Query Parameters:**
- `category` (optional): Filter by category ID
- `search` (optional): Search by product name
- `page` (optional): Page number for pagination
- `limit` (optional): Number of items per page

**Response:**
```json
{
    "count": 100,
    "next": "http://localhost:8000/api/products/?page=2",
    "previous": null,
    "results": [
        {
            "id": 1,
            "name": "Fresh Apples",
            "description": "Organic red apples",
            "price": "4.99",
            "image": "/media/products/apple.jpg",
            "category": {
                "id": 1,
                "name": "Fruits"
            },
            "in_stock": true,
            "stock_quantity": 50
        }
    ]
}
```

### Get Product Details
```http
GET /api/products/{id}/
```

### Create Product (Admin only)
```http
POST /api/products/
Content-Type: application/json

{
    "name": "Product Name",
    "description": "Product description",
    "price": "9.99",
    "category_id": 1,
    "stock_quantity": 100,
    "image": "base64_encoded_image_or_url"
}
```

## Categories API

### List Categories
```http
GET /api/categories/
```

**Response:**
```json
[
    {
        "id": 1,
        "name": "Fruits",
        "description": "Fresh fruits",
        "image": "/media/categories/fruits.jpg",
        "product_count": 25
    }
]
```

## Cart API

### Get Cart
```http
GET /api/cart/
```

### Add to Cart
```http
POST /api/cart/add/
Content-Type: application/json

{
    "product_id": 1,
    "quantity": 2
}
```

### Update Cart Item
```http
PUT /api/cart/items/{item_id}/
Content-Type: application/json

{
    "quantity": 3
}
```

### Remove from Cart
```http
DELETE /api/cart/items/{item_id}/
```

## Orders API

### Create Order
```http
POST /api/orders/
Content-Type: application/json

{
    "delivery_address": {
        "street": "123 Main St",
        "city": "City",
        "postal_code": "12345",
        "phone": "+1234567890"
    },
    "payment_method": "razorpay",
    "notes": "Please ring doorbell"
}
```

### List Orders
```http
GET /api/orders/
```

### Get Order Details
```http
GET /api/orders/{id}/
```

### Update Order Status (Admin only)
```http
PATCH /api/orders/{id}/
Content-Type: application/json

{
    "status": "processing"
}
```

**Order Status Values:**
- `pending`
- `confirmed`
- `processing`
- `shipped`
- `delivered`
- `cancelled`

## Payment API

### Create Payment Intent
```http
POST /api/payments/create/
Content-Type: application/json

{
    "order_id": 1,
    "amount": 25.99
}
```

### Verify Payment
```http
POST /api/payments/verify/
Content-Type: application/json

{
    "payment_id": "razorpay_payment_id",
    "order_id": "razorpay_order_id",
    "signature": "razorpay_signature"
}
```

## User Profile API

### Get Profile
```http
GET /api/profile/
```

### Update Profile
```http
PUT /api/profile/
Content-Type: application/json

{
    "first_name": "John",
    "last_name": "Doe",
    "email": "john@example.com",
    "phone": "+1234567890"
}
```

## Error Handling

The API returns standard HTTP status codes and JSON error responses:

```json
{
    "error": {
        "code": "VALIDATION_ERROR",
        "message": "Invalid input data",
        "details": {
            "field_name": ["This field is required"]
        }
    }
}
```

### Common Status Codes
- `200` - Success
- `201` - Created
- `400` - Bad Request
- `401` - Unauthorized
- `403` - Forbidden
- `404` - Not Found
- `500` - Internal Server Error

## Rate Limiting

API requests are rate limited to prevent abuse:
- Anonymous users: 100 requests per hour
- Authenticated users: 1000 requests per hour
- Admin users: 5000 requests per hour

## Pagination

List endpoints support pagination with the following parameters:
- `page`: Page number (default: 1)
- `limit`: Items per page (default: 20, max: 100)

## Webhooks

### Payment Webhooks
```http
POST /api/webhooks/payment/
Content-Type: application/json

{
    "event": "payment.captured",
    "payment": {
        "id": "payment_id",
        "amount": 2500,
        "currency": "INR",
        "status": "captured"
    }
}
```

## SDK Examples

### JavaScript (fetch)
```javascript
// Get products
fetch('/api/products/')
    .then(response => response.json())
    .then(data => console.log(data));

// Add to cart
fetch('/api/cart/add/', {
    method: 'POST',
    headers: {
        'Content-Type': 'application/json',
        'X-CSRFToken': getCookie('csrftoken')
    },
    body: JSON.stringify({
        product_id: 1,
        quantity: 2
    })
});
```

### Python (requests)
```python
import requests

# Get products
response = requests.get('http://localhost:8000/api/products/')
products = response.json()

# Add to cart
response = requests.post('http://localhost:8000/api/cart/add/', 
    json={'product_id': 1, 'quantity': 2},
    cookies={'sessionid': 'your_session_id'}
)
```