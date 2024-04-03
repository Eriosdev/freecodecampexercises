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
-- Name: cluster; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.cluster (
    cluster_id integer NOT NULL,
    name character varying(60) NOT NULL,
    luminosity integer NOT NULL,
    temperature integer NOT NULL,
    size numeric(3,1),
    descripcion text,
    visible boolean,
    spiral boolean
);


ALTER TABLE public.cluster OWNER TO freecodecamp;

--
-- Name: cluster_cluster_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.cluster_cluster_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cluster_cluster_id_seq OWNER TO freecodecamp;

--
-- Name: cluster_cluster_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.cluster_cluster_id_seq OWNED BY public.cluster.cluster_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(60) NOT NULL,
    luminosity integer NOT NULL,
    temperature integer NOT NULL,
    size numeric(3,1),
    descripcion text,
    supermassive_black_hole boolean,
    spiral boolean,
    cluster_id integer
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
    name character varying(60) NOT NULL,
    luminosity integer NOT NULL,
    temperature integer NOT NULL,
    size numeric(3,1),
    descripcion text,
    earth_like boolean,
    moons boolean,
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
    name character varying(60) NOT NULL,
    luminosity integer NOT NULL,
    temperature integer NOT NULL,
    size numeric(3,1),
    descripcion text,
    earth_like boolean,
    moons boolean,
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
    name character varying(60) NOT NULL,
    luminosity integer NOT NULL,
    temperature integer NOT NULL,
    size numeric(3,1),
    descripcion text,
    visible boolean,
    alive boolean,
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
-- Name: cluster cluster_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.cluster ALTER COLUMN cluster_id SET DEFAULT nextval('public.cluster_cluster_id_seq'::regclass);


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
-- Data for Name: cluster; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.cluster VALUES (1, 'Cluster 1', 50000, 7500, 10.0, 'Descripción del Cluster 1', true, false);
INSERT INTO public.cluster VALUES (2, 'Cluster 2', 60000, 8000, 10.0, 'Descripción del Cluster 2', true, true);
INSERT INTO public.cluster VALUES (3, 'Cluster 3', 45000, 7000, 10.0, 'Descripción del Cluster 3', false, false);
INSERT INTO public.cluster VALUES (4, 'Cluster 4', 70000, 8500, 10.0, 'Descripción del Cluster 4', true, true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Galaxy 1', 45000, 7000, 12.0, 'Descripción de la Galaxy 1', false, false, 1);
INSERT INTO public.galaxy VALUES (2, 'Galaxy 2', 55000, 8000, 16.0, 'Descripción de la Galaxy 2', true, true, 2);
INSERT INTO public.galaxy VALUES (3, 'Galaxy 3', 50000, 7500, 14.0, 'Descripción de la Galaxy 3', true, false, 1);
INSERT INTO public.galaxy VALUES (4, 'Galaxy 4', 50000, 7500, 14.0, 'Descripción de la Galaxy 4', true, false, 1);
INSERT INTO public.galaxy VALUES (5, 'Galaxy 5', 50000, 7500, 14.0, 'Descripción de la Galaxy 5', true, false, 1);
INSERT INTO public.galaxy VALUES (6, 'Galaxy 6', 48000, 7200, 11.0, 'Descripción de la Galaxy 6', false, true, 3);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon 1', 100, 200, 0.5, 'Descripción de la Moon 1', false, false, 1);
INSERT INTO public.moon VALUES (2, 'Moon 2', 120, 220, 0.6, 'Descripción de la Moon 2', false, false, 2);
INSERT INTO public.moon VALUES (3, 'Moon 3', 90, 180, 0.4, 'Descripción de la Moon 3', false, false, 1);
INSERT INTO public.moon VALUES (4, 'Moon 4', 90, 180, 0.4, 'Descripción de la Moon 4', false, false, 1);
INSERT INTO public.moon VALUES (5, 'Moon 5', 90, 180, 0.4, 'Descripción de la Moon 5', false, false, 1);
INSERT INTO public.moon VALUES (6, 'Moon 6', 90, 180, 0.4, 'Descripción de la Moon 6', false, false, 1);
INSERT INTO public.moon VALUES (7, 'Moon 7', 90, 180, 0.4, 'Descripción de la Moon 7', false, false, 1);
INSERT INTO public.moon VALUES (8, 'Moon 8', 90, 180, 0.4, 'Descripción de la Moon 8', false, false, 1);
INSERT INTO public.moon VALUES (9, 'Moon 9', 90, 180, 0.4, 'Descripción de la Moon 9', false, false, 1);
INSERT INTO public.moon VALUES (10, 'Moon 10', 90, 180, 0.4, 'Descripción de la Moon 10', false, false, 1);
INSERT INTO public.moon VALUES (11, 'Moon 11', 90, 180, 0.4, 'Descripción de la Moon 11', false, false, 1);
INSERT INTO public.moon VALUES (12, 'Moon 12', 90, 180, 0.4, 'Descripción de la Moon 12', false, false, 1);
INSERT INTO public.moon VALUES (13, 'Moon 13', 90, 180, 0.4, 'Descripción de la Moon 13', false, false, 1);
INSERT INTO public.moon VALUES (14, 'Moon 14', 90, 180, 0.4, 'Descripción de la Moon 14', false, false, 1);
INSERT INTO public.moon VALUES (15, 'Moon 15', 90, 180, 0.4, 'Descripción de la Moon 15', false, false, 1);
INSERT INTO public.moon VALUES (16, 'Moon 16', 90, 180, 0.4, 'Descripción de la Moon 16', false, false, 1);
INSERT INTO public.moon VALUES (17, 'Moon 17', 90, 180, 0.4, 'Descripción de la Moon 17', false, false, 1);
INSERT INTO public.moon VALUES (18, 'Moon 18', 90, 180, 0.4, 'Descripción de la Moon 18', false, false, 1);
INSERT INTO public.moon VALUES (19, 'Moon 19', 90, 180, 0.4, 'Descripción de la Moon 19', false, false, 1);
INSERT INTO public.moon VALUES (20, 'Moon 20', 90, 180, 0.4, 'Descripción de la Moon 20', false, false, 1);
INSERT INTO public.moon VALUES (21, 'Moon 21', 150, 250, 0.7, 'Descripción de la Moon 21', false, false, 3);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Planet 1', 2000, 500, 1.0, 'Descripción del Planet 1', true, true, 1);
INSERT INTO public.planet VALUES (2, 'Planet 2', 2500, 550, 1.5, 'Descripción del Planet 2', false, false, 2);
INSERT INTO public.planet VALUES (3, 'Planet 3', 1800, 480, 1.2, 'Descripción del Planet 3', true, true, 1);
INSERT INTO public.planet VALUES (4, 'Planet 4', 1800, 480, 1.2, 'Descripción del Planet 4', true, true, 1);
INSERT INTO public.planet VALUES (5, 'Planet 5', 1800, 480, 1.2, 'Descripción del Planet 5', true, true, 1);
INSERT INTO public.planet VALUES (6, 'Planet 6', 1800, 480, 1.2, 'Descripción del Planet 6', true, true, 1);
INSERT INTO public.planet VALUES (7, 'Planet 7', 1800, 480, 1.2, 'Descripción del Planet 7', true, true, 1);
INSERT INTO public.planet VALUES (8, 'Planet 8', 1800, 480, 1.2, 'Descripción del Planet 8', true, true, 1);
INSERT INTO public.planet VALUES (9, 'Planet 9', 1800, 480, 1.2, 'Descripción del Planet 9', true, true, 1);
INSERT INTO public.planet VALUES (10, 'Planet 10', 1800, 480, 1.2, 'Descripción del Planet 10', true, true, 1);
INSERT INTO public.planet VALUES (11, 'Planet 11', 1800, 480, 1.2, 'Descripción del Planet 11', true, true, 1);
INSERT INTO public.planet VALUES (12, 'Planet 12', 3000, 600, 2.0, 'Descripción del Planet 12', false, true, 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Star 1', 15000, 6000, 10.0, 'Descripción de la Star 1', true, true, 1);
INSERT INTO public.star VALUES (2, 'Star 2', 18000, 6500, 15.0, 'Descripción de la Star 2', true, true, 2);
INSERT INTO public.star VALUES (3, 'Star 3', 14000, 5800, 12.0, 'Descripción de la Star 3', false, false, 1);
INSERT INTO public.star VALUES (4, 'Star 4', 14000, 5800, 12.0, 'Descripción de la Star 4', false, false, 1);
INSERT INTO public.star VALUES (5, 'Star 5', 14000, 5800, 12.0, 'Descripción de la Star 5', false, false, 1);
INSERT INTO public.star VALUES (6, 'Star 6', 20000, 7000, 20.0, 'Descripción de la Star 6', true, true, 3);


--
-- Name: cluster_cluster_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.cluster_cluster_id_seq', 4, true);


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
-- Name: cluster cluster_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.cluster
    ADD CONSTRAINT cluster_name_key UNIQUE (name);


--
-- Name: cluster cluster_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.cluster
    ADD CONSTRAINT cluster_pkey PRIMARY KEY (cluster_id);


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
-- Name: galaxy galaxy_cluster_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_cluster_id_fkey FOREIGN KEY (cluster_id) REFERENCES public.cluster(cluster_id);


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

