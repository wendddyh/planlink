# Plan Link 

This is a **Ruby on Rails** web application that allows users to rent venues and create events where they can invite people. The app is designed with a focus on mobile-first development, offering a smooth user experience on mobile devices. However, it currently lacks optimization for desktop use.

## Features

- **Venue Rental**: Users can browse and rent various venues.
- **Event Creation**: Organize and manage events, and invite people.
- **Cloudinary Integration**: Image uploads are handled using **Cloudinary**.
- **Mobile-First Design**: Optimized primarily for mobile devices.

## Technologies Used

- **Ruby on Rails**: The backend framework.
- **CSS** & **JavaScript**: For custom styling and interaction.
- **Cloudinary**: For storing and retrieving images.

## Installation Guide

To set up and run this project on your local machine, follow the steps below.

### 1. Clone the Repository

First, clone the repository to your local machine:

```bash
git clone https://github.com/<your-username>/<repository-name>.git
cd <repository-name>
```

### Dependencies
This app require Ruby and Bundle to be installed.
```bash
gem install bundler
bundle install
```

### Set up database
```bash
rails db:create
rails db:migrate
```

### Set up Cloudinary
This app uses cloudinary to store images. You need to set up your own api key and set it in local environment. This file has been set in .gitignore
```bash
CLOUDINARY_CLOUD_NAME=<your-cloud-name>
CLOUDINARY_API_KEY=<your-api-key>
CLOUDINARY_API_SECRET=<your-api-secret>
```

### Run the app
```bash
rails s
```

### Notes of Improvement
- **Optimize the app for desktop use**
- **Use Google Places API** -The apps currently use seeded data and not a real-time database.
- **UX/UI Enhancements** - Add more responsive design elements.
