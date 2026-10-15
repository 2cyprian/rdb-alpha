--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    comet_type character varying(30),
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years integer
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    galaxy_type character varying(30),
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years integer,
    distance_from_earth numeric
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    moon_type character varying(30),
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years integer,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    planet_type character varying(30),
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years integer,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    star_type character varying(30),
    is_spherical boolean,
    age_in_millions_of_years integer,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halley', 'Famous periodic comet', 'Periodic', false, false, 4500);
INSERT INTO public.comet VALUES (2, 'Hale-Bopp', 'Great comet of 1997', 'Long-period', false, false, 4500);
INSERT INTO public.comet VALUES (3, 'NEOWISE', 'Bright comet of 2020', 'Long-period', false, false, 4500);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy', 'Spiral', true, true, 13600, 0);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest large galaxy', 'Spiral', true, true, 10000, 2537000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Third largest in Local Group', 'Spiral', false, true, 12000, 2730000);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Interacting grand design spiral', 'Spiral', false, true, 400, 31000000);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Peculiar galaxy', 'Elliptical', false, true, 13000, 31000000);
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', 'Satellite of Milky Way', 'Irregular', true, false, 13000, 163000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Earth''s moon', 'Natural', false, true, 4500, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Mars moon', 'Natural', false, false, 4500, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Mars moon', 'Natural', false, false, 4500, 4);
INSERT INTO public.moon VALUES (4, 'Io', 'Volcanic moon', 'Natural', false, true, 4500, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 'Icy moon', 'Natural', false, true, 4500, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'Largest moon', 'Natural', false, true, 4500, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 'Cratered moon', 'Natural', false, true, 4500, 5);
INSERT INTO public.moon VALUES (8, 'Titan', 'Thick atmosphere', 'Natural', false, true, 4500, 6);
INSERT INTO public.moon VALUES (9, 'Rhea', 'Saturn moon', 'Natural', false, true, 4500, 6);
INSERT INTO public.moon VALUES (10, 'Iapetus', 'Two-toned moon', 'Natural', false, true, 4500, 6);
INSERT INTO public.moon VALUES (11, 'Dione', 'Saturn moon', 'Natural', false, true, 4500, 6);
INSERT INTO public.moon VALUES (12, 'Tethys', 'Icy Saturn moon', 'Natural', false, true, 4500, 6);
INSERT INTO public.moon VALUES (13, 'Enceladus', 'Geysers', 'Natural', false, true, 4500, 6);
INSERT INTO public.moon VALUES (14, 'Mimas', 'Death Star moon', 'Natural', false, true, 4500, 6);
INSERT INTO public.moon VALUES (15, 'Miranda', 'Uranus moon', 'Natural', false, true, 4500, 7);
INSERT INTO public.moon VALUES (16, 'Ariel', 'Uranus moon', 'Natural', false, true, 4500, 7);
INSERT INTO public.moon VALUES (17, 'Umbriel', 'Dark Uranus moon', 'Natural', false, true, 4500, 7);
INSERT INTO public.moon VALUES (18, 'Titania', 'Largest Uranus moon', 'Natural', false, true, 4500, 7);
INSERT INTO public.moon VALUES (19, 'Oberon', 'Outermost Uranus moon', 'Natural', false, true, 4500, 7);
INSERT INTO public.moon VALUES (20, 'Triton', 'Retrograde moon', 'Natural', false, true, 4500, 8);
INSERT INTO public.moon VALUES (21, 'Charon', 'Pluto moon', 'Natural', false, true, 4500, 9);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Smallest planet', 'Terrestrial', false, true, 4500, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'Hottest planet', 'Terrestrial', false, true, 4500, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'Our home', 'Terrestrial', true, true, 4500, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'Red planet', 'Terrestrial', false, true, 4600, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Largest planet', 'Gas Giant', false, true, 4600, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Ringed planet', 'Gas Giant', false, true, 4500, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Ice giant', 'Ice Giant', false, true, 4500, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Farthest planet', 'Ice Giant', false, true, 4500, 1);
INSERT INTO public.planet VALUES (9, 'Proxima b', 'Exoplanet', 'Terrestrial', false, true, 4850, 4);
INSERT INTO public.planet VALUES (10, 'Kepler-452b', 'Super-Earth', 'Terrestrial', false, true, 6000, 1);
INSERT INTO public.planet VALUES (11, 'TRAPPIST-1e', 'Potentially habitable', 'Terrestrial', false, true, 7600, 1);
INSERT INTO public.planet VALUES (12, '51 Pegasi b', 'First exoplanet found', 'Gas Giant', false, true, 6200, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'Our star', 'G-type', true, 4600, 1);
INSERT INTO public.star VALUES (2, 'Sirius', 'Brightest in night sky', 'A-type', true, 240, 1);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 'Red supergiant', 'M-type', true, 8000, 1);
INSERT INTO public.star VALUES (4, 'Alpha Centauri A', 'Closest star system', 'G-type', true, 5300, 1);
INSERT INTO public.star VALUES (5, 'Vega', 'Bright northern star', 'A-type', true, 455, 1);
INSERT INTO public.star VALUES (6, 'Polaris', 'North Star', 'F-type', true, 70, 1);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


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
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

