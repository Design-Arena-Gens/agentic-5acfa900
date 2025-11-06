CREATE TABLE IF NOT EXISTS users (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(80) NOT NULL,
    last_name VARCHAR(80) NOT NULL,
    email VARCHAR(160) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    gender ENUM('male','female','other') NOT NULL,
    birth_date DATE NOT NULL,
    phone VARCHAR(32) NOT NULL,
    city VARCHAR(120) NOT NULL,
    country VARCHAR(120) NOT NULL,
    religion VARCHAR(120) NULL,
    caste VARCHAR(120) NULL,
    education VARCHAR(160) NULL,
    profession VARCHAR(160) NULL,
    annual_income VARCHAR(120) NULL,
    marital_status ENUM('never_married','divorced','widowed','annulled') NOT NULL DEFAULT 'never_married',
    about TEXT NULL,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS partner_preferences (
    user_id INT UNSIGNED PRIMARY KEY,
    preferred_age_min TINYINT UNSIGNED NULL,
    preferred_age_max TINYINT UNSIGNED NULL,
    preferred_marital_status VARCHAR(64) NULL,
    preferred_religion VARCHAR(120) NULL,
    preferred_caste VARCHAR(120) NULL,
    preferred_city VARCHAR(120) NULL,
    preferred_education VARCHAR(160) NULL,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_partner_pref_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS expressed_interests (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    from_user_id INT UNSIGNED NOT NULL,
    to_user_id INT UNSIGNED NOT NULL,
    message TEXT NOT NULL,
    status ENUM('pending','accepted','declined') NOT NULL DEFAULT 'pending',
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_interest_from_user FOREIGN KEY (from_user_id) REFERENCES users(id) ON DELETE CASCADE,
    CONSTRAINT fk_interest_to_user FOREIGN KEY (to_user_id) REFERENCES users(id) ON DELETE CASCADE,
    CONSTRAINT uq_interest_pair UNIQUE (from_user_id, to_user_id)
) ENGINE=InnoDB;

CREATE INDEX idx_users_location ON users (country, city);
CREATE INDEX idx_users_religion_caste ON users (religion, caste);
CREATE INDEX idx_users_marital_status ON users (marital_status);
CREATE INDEX idx_expressed_interests_to_user ON expressed_interests (to_user_id, status);
