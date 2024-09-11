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
    name character varying(30) NOT NULL,
    galaxy_id integer NOT NULL,
    galaxy_type character varying(20),
    has_life boolean,
    is_spherical boolean
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
-- Name: mars; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.mars (
    mars_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL
);


ALTER TABLE public.mars OWNER TO freecodecamp;

--
-- Name: mars_mars_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.mars_mars_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mars_mars_id_seq OWNER TO freecodecamp;

--
-- Name: mars_mars_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.mars_mars_id_seq OWNED BY public.mars.mars_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    name character varying(30) NOT NULL,
    moon_id integer NOT NULL,
    moon_age integer,
    description text,
    distance_from_earth numeric(10,1),
    planet_id integer NOT NULL
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
    name character varying(30) NOT NULL,
    planet_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    planet_type character varying(20),
    age integer,
    distance_from_earth numeric(10,1),
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
    name character varying(30) NOT NULL,
    star_id integer NOT NULL,
    distance_from_earth numeric(10,1),
    has_life boolean,
    galaxy_id integer,
    planet_id integer NOT NULL
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: mars mars_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.mars ALTER COLUMN mars_id SET DEFAULT nextval('public.mars_mars_id_seq'::regclass);


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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Andromeda', 1, 'Spiral', true, true);
INSERT INTO public.galaxy VALUES ('Milky Way', 2, 'Barred', true, true);
INSERT INTO public.galaxy VALUES ('Triangulum', 3, 'Spiral', false, true);
INSERT INTO public.galaxy VALUES ('Whirlpool', 4, 'Spiral', false, true);
INSERT INTO public.galaxy VALUES ('Sombrero', 5, 'Lenticular', false, true);
INSERT INTO public.galaxy VALUES ('Black Eye', 6, 'Spiral', false, true);
INSERT INTO public.galaxy VALUES ('Cartwheel', 7, 'Ring', false, false);
INSERT INTO public.galaxy VALUES ('Messier 87', 8, 'Elliptical', false, true);
INSERT INTO public.galaxy VALUES ('Large Magellanic', 9, 'Irregular', false, false);
INSERT INTO public.galaxy VALUES ('Small Magellanic', 10, 'Irregular', false, false);
INSERT INTO public.galaxy VALUES ('Centaurus A', 11, 'Elliptical', false, true);
INSERT INTO public.galaxy VALUES ('IC 1101', 12, 'Elliptical', false, true);
INSERT INTO public.galaxy VALUES ('Pinwheel', 13, 'Spiral', false, true);
INSERT INTO public.galaxy VALUES ('Tadpole', 14, 'Spiral', false, false);
INSERT INTO public.galaxy VALUES ('Hoag''s Object', 15, 'Ring', false, false);
INSERT INTO public.galaxy VALUES ('Antennae', 16, 'Irregular', false, false);
INSERT INTO public.galaxy VALUES ('NGC 1300', 17, 'Barred', false, true);
INSERT INTO public.galaxy VALUES ('IC 342', 18, 'Spiral', false, true);
INSERT INTO public.galaxy VALUES ('Virgo Stellar', 19, 'Elliptical', false, true);
INSERT INTO public.galaxy VALUES ('Leo Stellar', 20, 'Elliptical', false, true);


--
-- Data for Name: mars; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.mars VALUES (1, 1, 'Mars A');
INSERT INTO public.mars VALUES (2, 1, 'Mars B');
INSERT INTO public.mars VALUES (3, 1, 'Mars C');
INSERT INTO public.mars VALUES (4, 1, 'Mars D');
INSERT INTO public.mars VALUES (5, 1, 'Mars E');
INSERT INTO public.mars VALUES (6, 1, 'Mars F');
INSERT INTO public.mars VALUES (7, 1, 'Mars G');
INSERT INTO public.mars VALUES (8, 1, 'Mars H');
INSERT INTO public.mars VALUES (9, 1, 'Mars I');
INSERT INTO public.mars VALUES (10, 1, 'Mars J');
INSERT INTO public.mars VALUES (11, 1, 'Mars K');
INSERT INTO public.mars VALUES (12, 1, 'Mars L');
INSERT INTO public.mars VALUES (13, 1, 'Mars M');
INSERT INTO public.mars VALUES (14, 1, 'Mars N');
INSERT INTO public.mars VALUES (15, 1, 'Mars O');
INSERT INTO public.mars VALUES (16, 1, 'Mars P');
INSERT INTO public.mars VALUES (17, 1, 'Mars Q');
INSERT INTO public.mars VALUES (18, 1, 'Mars R');
INSERT INTO public.mars VALUES (19, 1, 'Mars S');
INSERT INTO public.mars VALUES (20, 1, 'Mars T');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Luna', 1, 4500, 'Earth''s only natural satellite', 384400.0, 3);
INSERT INTO public.moon VALUES ('Phobos', 2, 4500, 'One of the moons of Mars, irregular shape', 9380.0, 4);
INSERT INTO public.moon VALUES ('Deimos', 3, 4500, 'Smaller moon of Mars', 23460.0, 4);
INSERT INTO public.moon VALUES ('Io', 4, 4500, 'Volcanically active moon of Jupiter', 628730.0, 5);
INSERT INTO public.moon VALUES ('Europa', 5, 4500, 'Ice-covered moon of Jupiter', 628730.0, 5);
INSERT INTO public.moon VALUES ('Ganymede', 6, 4500, 'Largest moon in the solar system', 1070400.0, 5);
INSERT INTO public.moon VALUES ('Callisto', 7, 4500, 'Heavily cratered moon of Jupiter', 1882700.0, 5);
INSERT INTO public.moon VALUES ('Titan', 8, 4500, 'Saturn''s largest moon with a dense atmosphere', 1200000.0, 6);
INSERT INTO public.moon VALUES ('Enceladus', 9, 4500, 'Ice-covered moon of Saturn', 1200000.0, 6);
INSERT INTO public.moon VALUES ('Mimas', 10, 4500, 'Small moon of Saturn, looks like the Death Star', 1190000.0, 6);
INSERT INTO public.moon VALUES ('Triton', 11, 4500, 'Neptune''s largest moon, retrograde orbit', 4350000.0, 7);
INSERT INTO public.moon VALUES ('Oberon', 12, 4500, 'Second largest moon of Uranus', 2872400.0, 8);
INSERT INTO public.moon VALUES ('Titania', 13, 4500, 'Largest moon of Uranus', 2872400.0, 8);
INSERT INTO public.moon VALUES ('Umbriel', 14, 4500, 'Dark moon of Uranus', 2872400.0, 8);
INSERT INTO public.moon VALUES ('Ariel', 15, 4500, 'Brightest moon of Uranus', 2872400.0, 8);
INSERT INTO public.moon VALUES ('Miranda', 16, 4500, 'Small moon of Uranus, heavily deformed', 2872400.0, 8);
INSERT INTO public.moon VALUES ('Charon', 17, 4500, 'Largest moon of Pluto', 7560000.0, 9);
INSERT INTO public.moon VALUES ('Nix', 18, 4500, 'One of Pluto''s smaller moons', 7560000.0, 9);
INSERT INTO public.moon VALUES ('Hydra', 19, 4500, 'Another small moon of Pluto', 7560000.0, 9);
INSERT INTO public.moon VALUES ('Dysnomia', 20, 4500, 'The only moon of Eris', 9600000.0, 10);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Earth', 1, 1, 'Terrestrial', 4500, 10.0, 1);
INSERT INTO public.planet VALUES ('Mars', 2, 1, 'Terrestrial', 4500, 10.0, 2);
INSERT INTO public.planet VALUES ('Jupiter', 3, 1, 'Gas Giant', 4500, 10.0, 3);
INSERT INTO public.planet VALUES ('Saturn', 4, 1, 'Gas Giant', 4500, 10.0, 4);
INSERT INTO public.planet VALUES ('Neptune', 5, 1, 'Ice Giant', 4500, 10.0, 5);
INSERT INTO public.planet VALUES ('Uranus', 6, 1, 'Ice Giant', 4500, 10.0, 6);
INSERT INTO public.planet VALUES ('Pluto', 7, 1, 'Dwarf Planet', 4500, 10.0, 7);
INSERT INTO public.planet VALUES ('Eris', 8, 1, 'Dwarf Planet', 4500, 10.0, 8);
INSERT INTO public.planet VALUES ('Kepler-22b', 9, 2, 'Exoplanet', 2000, 10.0, 9);
INSERT INTO public.planet VALUES ('Gliese 581g', 10, 2, 'Exoplanet', 2500, 10.0, 10);
INSERT INTO public.planet VALUES ('Proxima Centauri b', 11, 2, 'Exoplanet', 3000, 10.0, 11);
INSERT INTO public.planet VALUES ('HD 209458 b', 12, 2, 'Exoplanet', 4000, 10.0, 12);
INSERT INTO public.planet VALUES ('51 Pegasi b', 13, 2, 'Exoplanet', 3500, 10.0, 13);
INSERT INTO public.planet VALUES ('Trappist-1d', 14, 2, 'Exoplanet', 1000, 10.0, 14);
INSERT INTO public.planet VALUES ('HD 189733 b', 15, 2, 'Exoplanet', 1200, 10.0, 15);
INSERT INTO public.planet VALUES ('Wasp-12b', 16, 2, 'Exoplanet', 1400, 10.0, 16);
INSERT INTO public.planet VALUES ('Wasp-39b', 17, 2, 'Exoplanet', 1300, 10.0, 17);
INSERT INTO public.planet VALUES ('Wasp-46b', 18, 2, 'Exoplanet', 1600, 10.0, 18);
INSERT INTO public.planet VALUES ('Kepler-186f', 19, 2, 'Exoplanet', 1800, 10.0, 19);
INSERT INTO public.planet VALUES ('Kepler-62e', 20, 2, 'Exoplanet', 1700, 10.0, 20);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('Sirius', 1, 20.0, true, 1, 1);
INSERT INTO public.star VALUES ('Canopus', 2, 20.0, false, 1, 2);
INSERT INTO public.star VALUES ('Arcturus', 3, 20.0, false, 1, 3);
INSERT INTO public.star VALUES ('Vega', 4, 20.0, true, 1, 4);
INSERT INTO public.star VALUES ('Capella', 5, 20.0, false, 1, 5);
INSERT INTO public.star VALUES ('Rigel', 6, 20.0, true, 1, 6);
INSERT INTO public.star VALUES ('Procyon', 7, 20.0, false, 1, 7);
INSERT INTO public.star VALUES ('Achernar', 8, 20.0, true, 1, 8);
INSERT INTO public.star VALUES ('Betelgeuse', 9, 20.0, false, 1, 9);
INSERT INTO public.star VALUES ('Antares', 10, 20.0, true, 1, 10);
INSERT INTO public.star VALUES ('Aldebaran', 11, 20.0, false, 1, 11);
INSERT INTO public.star VALUES ('Altair', 12, 20.0, true, 1, 12);
INSERT INTO public.star VALUES ('Deneb', 13, 20.0, false, 1, 13);
INSERT INTO public.star VALUES ('Spica', 14, 20.0, true, 1, 14);
INSERT INTO public.star VALUES ('Pollux', 15, 20.0, false, 1, 15);
INSERT INTO public.star VALUES ('Fomalhaut', 16, 20.0, true, 1, 16);
INSERT INTO public.star VALUES ('Dube', 17, 20.0, false, 1, 17);
INSERT INTO public.star VALUES ('Epsilon Eridani', 18, 20.0, true, 1, 18);
INSERT INTO public.star VALUES ('Atria', 19, 20.0, false, 1, 19);
INSERT INTO public.star VALUES ('Alnilam', 20, 20.0, true, 1, 20);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: mars_mars_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.mars_mars_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: mars mars_mars_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.mars
    ADD CONSTRAINT mars_mars_id_key UNIQUE (mars_id);


--
-- Name: mars mars_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.mars
    ADD CONSTRAINT mars_pkey PRIMARY KEY (mars_id);


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
-- Name: mars mars_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.mars
    ADD CONSTRAINT mars_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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
-- Name: star star_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- PostgreSQL database dump complete
--

