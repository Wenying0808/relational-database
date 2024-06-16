--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: astronomical_event; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.astronomical_event (
    astronomical_event_id integer NOT NULL,
    name character varying(100) NOT NULL,
    year_occurred integer,
    magnitude numeric,
    description text,
    was_visible boolean
);


ALTER TABLE public.astronomical_event OWNER TO freecodecamp;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    number_of_stars integer NOT NULL,
    distance_from_earth numeric,
    description text,
    is_visible boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    planet_id integer NOT NULL,
    diameter numeric,
    description text,
    has_water boolean
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    star_id integer NOT NULL,
    orbital_radius numeric,
    description text,
    has_life boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer NOT NULL,
    luminosity numeric,
    description text,
    is_visible boolean
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Data for Name: astronomical_event; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.astronomical_event VALUES (1, 'HalleyComet', 1986, 1.5, 'The most famous periodic comet.', true);
INSERT INTO public.astronomical_event VALUES (2, 'Lunar Eclipse', 2021, -1.0, 'A total lunar eclipse visible from many parts of the world.', true);
INSERT INTO public.astronomical_event VALUES (3, 'Supernova 1987A', 1987, -15.0, 'A supernova in the Large Magellanic Cloud.', false);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 250000000, 0, 'The galaxy that contains our Solar System.', true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 1000000000, 2537000, 'The nearest spiral galaxy to the Milky Way.', true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 40000000, 3000000, 'A member of the Local Group of galaxies.', true);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 1000000000, 23000000, 'A classic spiral galaxy in the constellation Canes Venatici.', true);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 800000000, 29000000, 'A galaxy in the constellation Virgo.', false);
INSERT INTO public.galaxy VALUES (6, 'Messier 82', 300000000, 11700000, 'A starburst galaxy approximately 12 million light-years away.', true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 3474.8, 'only natural satellite.', true);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 22.4, 'A moon of Mars.', false);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 12.4, 'A moon of Mars.', false);
INSERT INTO public.moon VALUES (4, 'Io', 5, 3643.2, 'A moon of Jupiter with active volcanism.', false);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 3121.6, 'A moon of Jupiter with a subsurface ocean.', true);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 5262.4, 'The largest moon in the Solar System.', true);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 4820.6, 'A moon of Jupiter.', true);
INSERT INTO public.moon VALUES (8, 'Titan', 6, 5149.5, 'The largest moon of Saturn.', true);
INSERT INTO public.moon VALUES (9, 'Rhea', 6, 1528.0, 'A moon of Saturn.', false);
INSERT INTO public.moon VALUES (10, 'Iapetus', 6, 1469.0, 'A moon of Saturn.', false);
INSERT INTO public.moon VALUES (11, 'Triton', 8, 2706.8, 'The largest moon of Neptune.', true);
INSERT INTO public.moon VALUES (12, 'Charon', 9, 1212.0, 'The largest moon of the dwarf planet Pluto.', true);
INSERT INTO public.moon VALUES (13, 'Oberon', 7, 1523.0, 'A moon of Uranus.', false);
INSERT INTO public.moon VALUES (14, 'Titania', 7, 1577.8, 'The largest moon of Uranus.', false);
INSERT INTO public.moon VALUES (15, 'Ariel', 7, 1157.8, 'A moon of Uranus.', false);
INSERT INTO public.moon VALUES (16, 'Umbriel', 7, 1169.4, 'A moon of Uranus.', false);
INSERT INTO public.moon VALUES (17, 'Miranda', 7, 471.6, 'A moon of Uranus.', false);
INSERT INTO public.moon VALUES (18, 'Mimas', 6, 396.6, 'A moon of Saturn.', false);
INSERT INTO public.moon VALUES (19, 'Enceladus', 6, 504.2, 'A moon of Saturn with subsurface ocean.', true);
INSERT INTO public.moon VALUES (20, 'Dione', 6, 1122.8, 'A moon of Saturn.', true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 0.39, 'The smallest planet in the Solar System.', false);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 0.72, 'The second planet from the Sun.', false);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 1.0, 'The third planet from the Sun and home to humanity.', true);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 1.52, 'The fourth planet from the Sun.', false);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 5.2, 'The largest planet in the Solar System.', false);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 9.58, 'Known for its prominent ring system.', false);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 19.22, 'The seventh planet from the Sun.', false);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 30.05, 'The eighth planet from the Sun.', false);
INSERT INTO public.planet VALUES (9, 'Proxima b', 4, 0.0485, 'An exoplanet orbiting the star Proxima Centauri.', false);
INSERT INTO public.planet VALUES (10, 'Kepler-22b', 2, 0.85, 'An exoplanet orbiting within the habitable zone of its star.', false);
INSERT INTO public.planet VALUES (11, 'HD 209458 b', 5, 0.047, 'A gas giant exoplanet.', false);
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1d', 6, 0.021, 'A potentially habitable exoplanet.', false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 1.0, 'The star at the center of the Solar System.', true);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 1, 120000, 'A red supergiant star in the Orion constellation.', true);
INSERT INTO public.star VALUES (3, 'Sirius', 1, 25.4, 'The brightest star in the night sky.', true);
INSERT INTO public.star VALUES (4, 'Alpha Centauri', 1, 1.519, 'The closest star system to the Solar System.', true);
INSERT INTO public.star VALUES (5, 'Vega', 1, 40, 'The fifth-brightest star in the night sky.', true);
INSERT INTO public.star VALUES (6, 'Rigel', 1, 120000, 'A blue supergiant star in the Orion constellation.', true);


--
-- Name: astronomical_event astronomical_event_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronomical_event
    ADD CONSTRAINT astronomical_event_name_key UNIQUE (name);


--
-- Name: astronomical_event astronomical_event_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronomical_event
    ADD CONSTRAINT astronomical_event_pkey PRIMARY KEY (astronomical_event_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon fk_moons_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_moons_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_planets_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planets_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star fk_stars_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_stars_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

