-- Galaxy table
CREATE TABLE galaxy (
    galaxy_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    description TEXT,
    galaxy_type VARCHAR(50),
    distance_from_earth INT NOT NULL,
    has_life BOOLEAN
);

-- Star table
CREATE TABLE star (
    star_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    galaxy_id INT REFERENCES galaxy(galaxy_id) ON DELETE CASCADE,
    star_type VARCHAR(50),
    age_in_millions_of_years INT,
    is_spherical BOOLEAN
);

-- Planet table
CREATE TABLE planet (
    planet_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    star_id INT REFERENCES star(star_id) ON DELETE CASCADE,
    planet_type VARCHAR(50),
    mass NUMERIC,
    has_life BOOLEAN
);

-- Moon table
CREATE TABLE moon (
    moon_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    planet_id INT REFERENCES planet(planet_id) ON DELETE CASCADE,
    radius INT,
    distance_from_planet INT,
    has_life BOOLEAN
);

-- Additional table, e.g., Satellite (for artificial satellites)
CREATE TABLE satellite (
    satellite_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    planet_id INT REFERENCES planet(planet_id) ON DELETE CASCADE,
    launch_date DATE,
    purpose TEXT,
    operational BOOLEAN NOT NULL
);


-- Insert data into galaxy table
INSERT INTO galaxy (name, description, galaxy_type, distance_from_earth, has_life) VALUES
('Milky Way', 'Our home galaxy', 'Spiral', 0, TRUE),
('Andromeda', 'Closest spiral galaxy', 'Spiral', 2537000, FALSE),
('Triangulum', 'Third-largest in the Local Group', 'Spiral', 3000000, FALSE),
('Whirlpool', 'Interacting grand-design spiral', 'Spiral', 23000000, FALSE),
('Sombrero', 'A bright galaxy with a large bulge', 'Unbarred spiral', 31000000, FALSE),
('Pinwheel', 'Face-on spiral galaxy', 'Spiral', 21200000, FALSE);

-- Insert data into star table
INSERT INTO star (name, galaxy_id, star_type, age_in_millions_of_years, is_spherical) VALUES
('Sun', 1, 'G-type', 4600, TRUE),
('Alpha Centauri', 1, 'G-type', 4500, TRUE),
('Betelgeuse', 1, 'M-type', 10000, TRUE),
('Sirius', 1, 'A-type', 300, TRUE),
('Proxima Centauri', 1, 'M-type', 4500, TRUE),
('Rigel', 1, 'B-type', 8000, TRUE);

-- Insert data into planet table
INSERT INTO planet (name, star_id, planet_type, mass, has_life) VALUES
('Earth', 1, 'Terrestrial', 5.97, TRUE),
('Mars', 1, 'Terrestrial', 0.642, FALSE),
('Jupiter', 1, 'Gas Giant', 1898, FALSE),
('Saturn', 1, 'Gas Giant', 568, FALSE),
('Venus', 1, 'Terrestrial', 4.87, FALSE),
('Mercury', 1, 'Terrestrial', 0.330, FALSE),
('Uranus', 1, 'Ice Giant', 86.8, FALSE),
('Neptune', 1, 'Ice Giant', 102, FALSE),
('Alpha Centauri Bb', 2, 'Terrestrial', 1.1, FALSE),
('Alpha Centauri Bc', 2, 'Gas Giant', 317.8, FALSE),
('Proxima Centauri b', 5, 'Terrestrial', 1.27, POSSIBLE),
('Proxima Centauri c', 5, 'Gas Giant', 8.57, POSSIBLE);

-- Insert data into moon table
INSERT INTO moon (name, planet_id, radius, distance_from_planet, has_life) VALUES
('Moon', 1, 1737, 384400, FALSE),
('Phobos', 2, 11, 9376, FALSE),
('Deimos', 2, 6, 23463, FALSE),
('Io', 3, 1821, 421700, FALSE),
('Europa', 3, 1560, 671034, POSSIBLE),
('Ganymede', 3, 2634, 1070400, FALSE),
('Callisto', 3, 2410, 1882700, FALSE),
('Titan', 4, 2575, 1221870, POSSIBLE),
('Rhea', 4, 763, 527040, FALSE),
('Iapetus', 4, 734, 3560820, FALSE),
('Dione', 4, 562, 377396, FALSE),
('Tethys', 4, 531, 294619, FALSE),
('Enceladus', 4, 252, 238042, POSSIBLE),
('Mimas', 4, 198, 185539, FALSE),
('Miranda', 7, 236, 129390, FALSE),
('Ariel', 7, 579, 191020, FALSE),
('Umbriel', 7, 584, 266300, FALSE),
('Titania', 7, 788, 435910, FALSE),
('Oberon', 7, 761, 583520, FALSE),
('Triton', 8, 1353, 354759, POSSIBLE);

-- Insert data into satellite table
INSERT INTO satellite (name, planet_id, launch_date, purpose, operational) VALUES
('Hubble Space Telescope', 3, '1990-04-24', 'Astronomy', TRUE),
('International Space Station', 1, '1998-11-20', 'Research', TRUE),
('Voyager 1', 3, '1977-09-05', 'Exploration', TRUE);
