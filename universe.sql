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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30),
    galaxy_type text,
    diameter_light_years integer,
    discovered_years integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30),
    orbital_periods integer,
    planet_id integer,
    diameter_km integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30),
    planet_types text,
    has_life boolean,
    distance_from_earth numeric(3,1),
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30),
    age_in_million_of_years integer,
    is_variable_star boolean,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 220000, 964);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 60000, 1654);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Spiral', 76000, 1773);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Elliptical', 50000, 1781);
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 'Elliptical', 120000, 1781);
INSERT INTO public.galaxy VALUES (7, 'Large Magellanic Cloud', 'Irregular', 14000, 1500);
INSERT INTO public.galaxy VALUES (8, 'Small Magellanic Cloud', 'Irregular', 7000, 1519);
INSERT INTO public.galaxy VALUES (9, 'Cartwheel Galaxy', 'Lenticular', 150000, 1941);
INSERT INTO public.galaxy VALUES (10, 'Hoag''s Object', 'Ring', 100000, 1950);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 27, 1, 3474);
INSERT INTO public.moon VALUES (2, 'Phobos', 0, 2, 22);
INSERT INTO public.moon VALUES (3, 'Deimos', 1, 2, 12);
INSERT INTO public.moon VALUES (4, 'Europa', 4, 3, 3122);
INSERT INTO public.moon VALUES (5, 'Ganymede', 7, 3, 5262);
INSERT INTO public.moon VALUES (6, 'Callisto', 16, 3, 4820);
INSERT INTO public.moon VALUES (7, 'Titan', 16, 4, 5150);
INSERT INTO public.moon VALUES (8, 'Enceladus', 1, 4, 504);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Terrestrial', true, 0.0, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 'Terrestrial', false, 0.5, 1);
INSERT INTO public.planet VALUES (3, 'Jupiter', 'Gas Giant', false, 4.2, 1);
INSERT INTO public.planet VALUES (4, 'Venus', 'Terrestrial', false, 0.3, 1);
INSERT INTO public.planet VALUES (5, 'Kepler-442b', 'Exoplanet', NULL, 99.9, 2);
INSERT INTO public.planet VALUES (6, 'Proxima b', 'Exoplanet', NULL, 4.2, 6);
INSERT INTO public.planet VALUES (7, 'Gliese 581g', 'Exoplanet', NULL, 20.3, 7);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 4600, false, 1);
INSERT INTO public.star VALUES (2, 'Sirius', 200, false, 1);
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', 5500, false, 1);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 8000, true, 2);
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 4850, true, 1);
INSERT INTO public.star VALUES (6, 'Vega', 455, false, 1);
INSERT INTO public.star VALUES (7, 'Rigel', 8600, true, 2);
INSERT INTO public.star VALUES (8, 'Antares', 12000, true, 3);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id) ON DELETE CASCADE;


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id) ON DELETE CASCADE;


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

