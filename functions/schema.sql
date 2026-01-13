-- Servers Table (The root of everything)
CREATE TABLE servers (
    id TEXT PRIMARY KEY, -- e.g., '19876493216946'
    name TEXT NOT NULL,
    owner_id TEXT NOT NULL
);

-- Departments Table
CREATE TABLE departments (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    server_id TEXT,
    dept_name TEXT NOT NULL, -- e.g., 'Police Department'
    FOREIGN KEY (server_id) REFERENCES servers(id)
);

-- Ranks Table (With your specific permission logic)
CREATE TABLE ranks (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    dept_id INTEGER,
    rank_name TEXT NOT NULL,
    rank_order INTEGER DEFAULT 0,
    can_overwrite BOOLEAN DEFAULT 0, -- Your "OVERWRITE"
    can_dispatch BOOLEAN DEFAULT 0,  -- Your "OVERWRITE2"
    is_admin BOOLEAN DEFAULT 0,      -- Your "ADMIN"
    FOREIGN KEY (dept_id) REFERENCES departments(id)
);

-- Users Table
CREATE TABLE users (
    id TEXT PRIMARY KEY,
    username TEXT UNIQUE,
    password_hash TEXT,
    server_list TEXT -- Stores comma-separated IDs: '198764,716984...'
);