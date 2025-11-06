# Matrimony Connect

Matrimony Connect is a PHP/MySQL matrimonial matchmaking platform that enables users to create detailed profiles, define partner preferences, search for compatible matches, and express interest in other members. The application is designed to run on serverless PHP runtimes (such as Vercel with `vercel-php`) and uses MySQL-compatible databases for persistence.

## Features

- Secure user registration and login with password hashing
- Comprehensive personal profiles with education, profession, and bio
- Partner preference management covering age, location, religion, and more
- Advanced profile search with filters for age, gender, religion, caste, city, and marital status
- Interest workflow for expressing, receiving, and responding to match requests
- Dashboard with actionable statistics and recommended matches

## Technology Stack

- PHP 8+ with PDO for database access
- MySQL-compatible database (MariaDB, PlanetScale, etc.)
- Serverless deployment via Vercel using the `vercel-php` runtime
- Vanilla HTML/CSS frontend with responsive design

## Getting Started Locally

1. **Install dependencies**
   - PHP 8.1+
   - Composer (optional, no packages required by default)
   - MySQL server

2. **Create the database**
   ```sql
   CREATE DATABASE matrimonial CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
   ```

3. **Import the schema**
   ```bash
   mysql -u <user> -p matrimonial < sql/schema.sql
   ```

4. **Configure environment variables**
   Create a `.env` file or export variables in your shell before starting the server:
   ```bash
   export DB_HOST=127.0.0.1
   export DB_PORT=3306
   export DB_NAME=matrimonial
   export DB_USER=root
   export DB_PASSWORD=secret
   ```

5. **Serve the application**
   ```bash
   php -S localhost:8000 -t public
   ```

6. **Access the app**: visit [http://localhost:8000](http://localhost:8000)

## Deployment

The repository includes a `vercel.json` configured for the `vercel-php` runtime. Ensure the following environment variables are set in Vercel before deploying:

- `DB_HOST`
- `DB_PORT`
- `DB_NAME`
- `DB_USER`
- `DB_PASSWORD`

Deploy using the CLI:

```bash
vercel deploy --prod --yes --token $VERCEL_TOKEN --name agentic-5acfa900
```

## Database Schema Overview

- `users`: core profile information and authentication data
- `partner_preferences`: saved search preferences for each user
- `expressed_interests`: relationship requests between users

Refer to `sql/schema.sql` for full definitions.

## License

Released under the MIT License.
