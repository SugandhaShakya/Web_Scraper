# Flipkart Web Scraper Application

## Project Overview

This web application scrapes product information from an e-commerce webpage - Flipkart and displays it in a user-friendly interface. It uses Ruby on Rails for the backend and Angular for the frontend.

## Core Features

- **Web Scraping & Data Storage:**
  - Scrapes product details (title, description, price, size, and category) from a given URL.
  - Stores the scraped data in a SQLite3 database.
- **Product Display and Management:**
  - Responsive UI for submitting URLs for scraping and viewing listed products.
  - Asynchronous data refetching and updating if the data is older than one week.
- **Search and Interaction:**
  - Asynchronous search feature for products.

## Technology Stack

- **Frontend:** Angular
- **Backend:** Ruby on Rails
- **Database:** SQLite3
- **Web Scraping:** Nokogiri, HTTParty

## Prerequisites

- Ruby 3.2.2
- Rails 7.0.8
- Node.js 20.11.1
- SQLite3
- Angular CLI 17.2.0

## Setup Instructions

### Backend (Ruby on Rails)

1. Clone the repository:
```sh
   git clone https://github.com/SugandhaShakya/Web_Scraper.git
   cd Web_Scraper/backend
```

2. Install dependencies:
```sh
    bundle install
```

3. Set up the database:
```sh
    rails db:create
    rails db:migrate
    rails db:seed
```

4. Start the Rails server:
```sh
    rails server
```

### Frontend (Angular)

1. Navigate to the frontend directory:
```sh
    cd ../frontend
```

2. Install dependencies:
```sh
    npm install
```

3. Start the Angular development server:
```sh
    ng serve
```

## Accessing the Application

- **Frontend:** Visit http://localhost:4200
- **Backend:** API endpoints are available at http://localhost:3000

## Running Tests
    
- **Backend:** To run tests for the Rails backend, use:
    rails test

- **Frontend:** To run tests for the Angular frontend, use:
    ng test

## Assumptions and Design Choices
- The project uses SQLite3 for simplicity.
- Web scraping is handled asynchronously to avoid blocking the user interface.

## Future Improvements
- Implement more comprehensive error handling for web scraping.
- Enhance the UI/UX with more detailed product views.
- Add pagination and sorting to the product list.

## Known Issues
- Some products might not scrape correctly due to changes in the source HTML structure.

## Project Structure

### Backend (Rails)
- app/controllers: Contains the controllers for handling HTTP requests.
- app/models: Contains the models for database interactions.
- app/services: Contains the web scraping service.
- config: Contains configuration files.

### Frontend (Angular)
- src/app: Contains the Angular components and services.

## Contact
For any questions or issues, please contact [shakyasugandha@gmail.com].