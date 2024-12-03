# Climbing App
A small application to find climbing places, such as boulders, gyms, routes, etc.

## Setup Instructions

### Prerequisites
- Ruby 3.2+
- Rails 8
- PostgreSQL
- Bundler

### Getting Started

1. Clone the repository:
```bash
git clone https://github.com/pedroFP/climbing-app
cd climbing-app
```

2. Install dependencies:
```bash
bundle install
```

3. Set up the database:
```bash
rails db:setup
```

4. Configure environment variables
Generate the credentials with the command
```bash
VISUAL="code --wait" bin/rails credentials:edit
```

Add the cariable `google_api_key` from your google dev account
