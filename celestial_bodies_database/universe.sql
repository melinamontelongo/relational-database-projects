--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(30) NOT NULL,
    size numeric(8,2),
    on_orbit boolean,
    year_discovered integer
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    size numeric(8,2),
    type character varying(30) NOT NULL,
    age numeric(8,2),
    year_discovered integer,
    description text
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
    size numeric(8,2),
    explored boolean,
    year_explored integer,
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
    name character varying(30) NOT NULL,
    size numeric(8,2),
    type character varying(30) NOT NULL,
    life boolean,
    explored boolean,
    year_explored integer,
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
    size numeric(8,2),
    type character varying(30) NOT NULL,
    age numeric(8,2),
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


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
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Vesta', 262.00, true, 1807);
INSERT INTO public.asteroid VALUES (2, 'Palas', 272.00, true, 1802);
INSERT INTO public.asteroid VALUES (3, 'Icarus', 5.00, true, 1949);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 46.56, 'Barred spiral', 1924.00, 10, 'Andromeda, which is shortened from "Andromeda Galaxy", gets its name from the area of the sky in which it appears, the constellation of Andromeda.');
INSERT INTO public.galaxy VALUES (2, 'Antennae', 150.00, 'lliding spiral galaxies', NULL, 1785, 'The Antennae Galaxies are a pair of interacting galaxies in the constellation Corvus');
INSERT INTO public.galaxy VALUES (3, 'Milky Way', 26.80, 'spiral', 13.61, 1610, 'La Vía Láctea ​ ​ es una galaxia espiral donde se encuentra el sistema solar y a su vez la Tierra.');
INSERT INTO public.galaxy VALUES (4, 'Sunflower', 14.00, 'spiral', 13.28, 1779, 'La Galaxia del Girasol es una galaxia espiral de la constelación de Canes Venatici.');
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 23.58, 'interacting spiral', 400.30, 1773, 'La galaxia Remolino es una clásica galaxia espiral localizada en la constelación Canes Venatici. Es una de las galaxias espirales más conocidas del firmamento.');
INSERT INTO public.galaxy VALUES (6, 'Fireworks', 26.77, 'spiral', 20.00, 1798, 'NGC 6946, sometimes referred to as the Fireworks Galaxy, is a face-on intermediate spiral galaxy with a small bright nucleus, whose location in the sky straddles the boundary between the northern constellations of Cepheus and Cygnus.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1.74, true, 1969, 1);
INSERT INTO public.moon VALUES (2, 'Fobos', 11.27, false, NULL, 3);
INSERT INTO public.moon VALUES (3, 'Deimos', 6.20, false, NULL, 3);
INSERT INTO public.moon VALUES (4, 'Calisto', 2.41, false, NULL, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 1.56, false, NULL, 5);
INSERT INTO public.moon VALUES (6, 'Titan', 2.57, false, NULL, 6);
INSERT INTO public.moon VALUES (7, 'Triton', 1.35, false, NULL, 8);
INSERT INTO public.moon VALUES (8, 'Ganimedes', 2.63, false, NULL, 5);
INSERT INTO public.moon VALUES (9, 'Io', 1.82, false, NULL, 5);
INSERT INTO public.moon VALUES (10, 'Miranda', 235.00, false, NULL, 7);
INSERT INTO public.moon VALUES (11, 'Titania', 788.00, false, NULL, 7);
INSERT INTO public.moon VALUES (12, 'Caronte', 606.00, false, NULL, 9);
INSERT INTO public.moon VALUES (13, 'Encelado', 252.00, false, NULL, 6);
INSERT INTO public.moon VALUES (14, 'Dione', 561.00, false, NULL, 6);
INSERT INTO public.moon VALUES (15, 'Japeto', 734.00, false, NULL, 6);
INSERT INTO public.moon VALUES (16, 'Rea', 763.00, false, NULL, 6);
INSERT INTO public.moon VALUES (17, 'Febe', 106.00, false, NULL, 6);
INSERT INTO public.moon VALUES (18, 'Mimas', 198.00, false, NULL, 6);
INSERT INTO public.moon VALUES (19, 'Hiperion', 135.00, false, NULL, 6);
INSERT INTO public.moon VALUES (20, 'Pan', 14.00, false, NULL, 6);
INSERT INTO public.moon VALUES (21, 'Epimeteo', 58.00, false, NULL, 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 6.37, 'Rocky, terrestrial', true, true, 0, 3);
INSERT INTO public.planet VALUES (2, 'Venus', 6.05, 'Rocky, terrestrial', false, false, NULL, 3);
INSERT INTO public.planet VALUES (3, 'Mars', 3.39, 'Rocky, terrestrial', false, true, 1997, 3);
INSERT INTO public.planet VALUES (4, 'Mercury', 2.44, 'Rocky, terrestrial', false, false, NULL, 3);
INSERT INTO public.planet VALUES (5, 'Jupiter', 69.91, 'Gas giant', false, false, NULL, 3);
INSERT INTO public.planet VALUES (6, 'Saturn', 58.23, 'Gas giant', false, false, NULL, 3);
INSERT INTO public.planet VALUES (7, 'Uranus', 25.36, 'Gas giant', false, false, NULL, 3);
INSERT INTO public.planet VALUES (8, 'Neptune', 24.62, 'Gas giant', false, false, NULL, 3);
INSERT INTO public.planet VALUES (9, 'Pluto', 1.19, 'Dwarf planet', false, false, NULL, 3);
INSERT INTO public.planet VALUES (10, 'Eris', 1.16, 'Dwarf planet', false, false, NULL, 3);
INSERT INTO public.planet VALUES (11, 'Makemake', 715.00, 'Dwarf planet', false, false, NULL, 3);
INSERT INTO public.planet VALUES (12, 'Ceres', 473.00, 'Dwarf planet', false, false, NULL, 3);
INSERT INTO public.planet VALUES (13, 'Haumea', 816.00, 'Dwarf planet', false, false, NULL, 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Alpheratz', 2.70, 'subgiant', 60.00, 1);
INSERT INTO public.star VALUES (2, 'Unknown', 100.00, 'Unknown', 100.00, 2);
INSERT INTO public.star VALUES (3, 'sun', 2.20, 'yellow dwarf', 4.60, 3);
INSERT INTO public.star VALUES (5, 'Unknown2', 1.00, 'unknown', NULL, 4);
INSERT INTO public.star VALUES (6, 'Sirius', 1.50, 'white dwarf', NULL, 3);
INSERT INTO public.star VALUES (7, 'Betelgeuse', 617.10, 'red supergiant', 10.01, 3);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 3, true);


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

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


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

