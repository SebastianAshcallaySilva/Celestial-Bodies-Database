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
    name character varying(30) NOT NULL,
    age_in_ga numeric(6,2),
    diameter_in_ly integer,
    year_discovered integer
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
    name character varying(30) NOT NULL,
    planet_name character varying(30),
    star_name character varying(30),
    galaxy_name character varying(30),
    has_atmosphere boolean,
    age_in_ga numeric(6,2),
    year_discovered integer,
    diameter_in_tkm numeric(8,2),
    planet_id integer,
    other_names text
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
    name character varying(30) NOT NULL,
    star_name character varying(30),
    galaxy_name character varying(30),
    has_moons boolean,
    age_in_ga numeric(6,2),
    year_discovered integer,
    diameter_in_tkm numeric(8,2),
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
    name character varying(30) NOT NULL,
    galaxy_name character varying(30),
    age_in_ga numeric(6,2),
    year_discovered integer,
    diameter_in_mkm numeric(8,2),
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
-- Name: universe_map; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.universe_map (
    universe_map_id integer NOT NULL,
    star_id integer,
    planet_id integer,
    moon_id integer,
    name character varying(30) NOT NULL,
    galaxy_id integer
);


ALTER TABLE public.universe_map OWNER TO freecodecamp;

--
-- Name: universe_map_universe_map_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.universe_map_universe_map_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.universe_map_universe_map_id_seq OWNER TO freecodecamp;

--
-- Name: universe_map_universe_map_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.universe_map_universe_map_id_seq OWNED BY public.universe_map.universe_map_id;


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
-- Name: universe_map universe_map_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe_map ALTER COLUMN universe_map_id SET DEFAULT nextval('public.universe_map_universe_map_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13.61, 105700, 1610);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10.01, 220000, 1764);
INSERT INTO public.galaxy VALUES (3, 'Messier 81', 13.31, 90000, 1774);
INSERT INTO public.galaxy VALUES (4, 'Comet', 1.00, 600000, 2007);
INSERT INTO public.galaxy VALUES (5, 'Messier 87', 13.24, 120000, 1781);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 0.40, 76900, 1773);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Earth', 'Sun', 'Milky Way', true, 4.53, NULL, 3.47, 3, 'Luna');
INSERT INTO public.moon VALUES (2, 'Phobos', 'Mars', 'Sun', 'Milky Way', false, 3.50, 1877, 0.02, 4, NULL);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Mars', 'Sun', 'Milky Way', false, 1.00, 1877, 12.40, 4, NULL);
INSERT INTO public.moon VALUES (4, 'Ganymede', 'Jupiter', 'Sun', 'Milky Way', true, 4.50, 1610, 5.27, 5, 'Jupiter III');
INSERT INTO public.moon VALUES (5, 'Europa', 'Jupiter', 'Sun', 'Milky Way', true, 4.50, 1610, 3.12, 5, 'Jupiter II');
INSERT INTO public.moon VALUES (6, 'Callisto', 'Jupiter', 'Sun', 'Milky Way', true, 4.50, 1610, 4.82, 5, 'Jupiter IV');
INSERT INTO public.moon VALUES (7, 'Io', 'Jupiter', 'Sun', 'Milky Way', true, 4.50, 1610, 3.64, 5, 'Jupiter I');
INSERT INTO public.moon VALUES (8, 'Kallichore', 'Jupiter', 'Sun', 'Milky Way', NULL, NULL, 2003, 2.00, 5, 'Jupiter XLIV');
INSERT INTO public.moon VALUES (9, 'Adrastea', 'Jupiter', 'Sun', 'Milky Way', NULL, NULL, 1979, 16.40, 5, NULL);
INSERT INTO public.moon VALUES (10, 'Rhea', 'Saturn', 'Sun', 'Milky Way', true, 4.00, 1672, 1.53, 6, 'Saturn V');
INSERT INTO public.moon VALUES (11, 'Dione', 'Saturn', 'Sun', 'Milky Way', true, 4.00, 1684, 1.12, 6, 'Saturn IV');
INSERT INTO public.moon VALUES (12, 'Enceladus', 'Saturn', 'Sun', 'Milky Way', true, 1.00, 1789, 0.50, 6, NULL);
INSERT INTO public.moon VALUES (13, 'Titan', 'Saturn', 'Sun', 'Milky Way', true, 4.00, 1655, 5.15, 6, 'Saturn VI');
INSERT INTO public.moon VALUES (14, 'Iapetus', 'Saturn', 'Sun', 'Milky Way', false, 4.56, 1671, 1.47, 6, 'Saturn VIII');
INSERT INTO public.moon VALUES (15, 'Hyperion', 'Saturn', 'Sun', 'Milky Way', false, NULL, 1848, 0.27, 6, 'Saturn VII');
INSERT INTO public.moon VALUES (16, 'Mimas', 'Saturn', 'Sun', 'Milky Way', false, NULL, 1789, 0.40, 6, 'Saturn I');
INSERT INTO public.moon VALUES (17, 'Tethys', 'Saturn', 'Sun', 'Milky Way', false, NULL, 1684, 1.06, 6, 'Saturn III');
INSERT INTO public.moon VALUES (18, 'Phoebe', 'Saturn', 'Sun', 'Milky Way', NULL, NULL, 1899, 0.21, 6, NULL);
INSERT INTO public.moon VALUES (19, 'Titania', 'Uranus', 'Sun', 'Milky Way', true, 4.60, 1787, 1.58, 7, 'Uranus III');
INSERT INTO public.moon VALUES (20, 'Ariel', 'Uranus', 'Sun', 'Milky Way', false, NULL, 1851, 1.16, 7, 'Uranus I');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Sun', 'Milky Way', false, 4.50, -3000, 4.88, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'Sun', 'Milky Way', false, 4.50, 1610, 12.10, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'Sun', 'Milky Way', true, 4.54, NULL, 12.74, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'Sun', 'Milky Way', true, 4.60, 1610, 6.78, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Sun', 'Milky Way', true, 4.60, 1610, 142.80, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Sun', 'Milky Way', true, 4.50, 1610, 120.54, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Sun', 'Milky Way', true, 4.50, 1781, 50.72, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Sun', 'Milky Way', true, 4.50, 1846, 49.24, 1);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri B', 'Proxima Centauri', 'Milky Way', false, 4.85, 2016, 13.12, 4);
INSERT INTO public.planet VALUES (10, 'Epsilon Eridani B', 'Epsilon Eridani', 'Milky Way', false, NULL, 2000, 128.69, 7);
INSERT INTO public.planet VALUES (11, 'Lalande 21185 B', 'Lalande 21185', 'Milky Way', false, NULL, 2017, 8.31, 8);
INSERT INTO public.planet VALUES (12, 'Lalande 21185 C', 'Lalande 21185', 'Milky Way', false, NULL, 2021, 64.95, 8);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'Milky Way', 4.60, NULL, 1.39, 1);
INSERT INTO public.star VALUES (2, 'Alpheratz', 'Andromeda', 0.06, NULL, 3.76, 2);
INSERT INTO public.star VALUES (3, '51 Andromedae', 'Andromeda', 1.70, NULL, 29.92, 2);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 'Milky Way', 4.85, 1915, 0.21, 1);
INSERT INTO public.star VALUES (5, 'Rigel', 'Milky Way', 0.01, 1781, 109.78, 1);
INSERT INTO public.star VALUES (6, 'Sirius', 'Milky Way', 0.23, 1844, 2.40, 1);
INSERT INTO public.star VALUES (7, 'Epsilon Eridani', 'Milky Way', 0.80, 2000, 1.02, 1);
INSERT INTO public.star VALUES (8, 'Lalande 21185', 'Milky Way', NULL, 1801, 0.55, 1);


--
-- Data for Name: universe_map; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.universe_map VALUES (1, 1, 3, 1, 'Moon', 1);
INSERT INTO public.universe_map VALUES (2, 1, 4, 2, 'Phobos', 1);
INSERT INTO public.universe_map VALUES (3, 1, 4, 3, 'Deimos', 1);
INSERT INTO public.universe_map VALUES (4, 1, 5, 4, 'Ganymede', 1);
INSERT INTO public.universe_map VALUES (5, 1, 5, 5, 'Europa', 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: universe_map_universe_map_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.universe_map_universe_map_id_seq', 5, true);


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
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


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
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: universe_map universe_map_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe_map
    ADD CONSTRAINT universe_map_pkey PRIMARY KEY (universe_map_id);


--
-- Name: universe_map universe_map_universe_map_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe_map
    ADD CONSTRAINT universe_map_universe_map_id_key UNIQUE (universe_map_id);


--
-- Name: universe_map fk_moon; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe_map
    ADD CONSTRAINT fk_moon FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: universe_map fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe_map
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: universe_map fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe_map
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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
-- Name: universe_map universe_map_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe_map
    ADD CONSTRAINT universe_map_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

