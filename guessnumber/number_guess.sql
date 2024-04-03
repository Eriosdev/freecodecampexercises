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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    number_of_guesses integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    name character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 17, 8);
INSERT INTO public.games VALUES (2, 322, 9);
INSERT INTO public.games VALUES (3, 13, 9);
INSERT INTO public.games VALUES (4, 393, 10);
INSERT INTO public.games VALUES (5, 368, 10);
INSERT INTO public.games VALUES (6, 891, 9);
INSERT INTO public.games VALUES (7, 728, 9);
INSERT INTO public.games VALUES (8, 929, 9);
INSERT INTO public.games VALUES (9, 353, 11);
INSERT INTO public.games VALUES (10, 567, 11);
INSERT INTO public.games VALUES (11, 530, 12);
INSERT INTO public.games VALUES (12, 302, 12);
INSERT INTO public.games VALUES (13, 344, 11);
INSERT INTO public.games VALUES (14, 187, 11);
INSERT INTO public.games VALUES (15, 275, 11);
INSERT INTO public.games VALUES (16, 322, 13);
INSERT INTO public.games VALUES (17, 295, 13);
INSERT INTO public.games VALUES (18, 552, 14);
INSERT INTO public.games VALUES (19, 150, 14);
INSERT INTO public.games VALUES (20, 970, 13);
INSERT INTO public.games VALUES (21, 373, 13);
INSERT INTO public.games VALUES (22, 934, 13);
INSERT INTO public.games VALUES (23, 469, 15);
INSERT INTO public.games VALUES (24, 148, 15);
INSERT INTO public.games VALUES (25, 72, 16);
INSERT INTO public.games VALUES (26, 162, 16);
INSERT INTO public.games VALUES (27, 949, 15);
INSERT INTO public.games VALUES (28, 192, 15);
INSERT INTO public.games VALUES (29, 747, 15);
INSERT INTO public.games VALUES (30, 2, 8);
INSERT INTO public.games VALUES (31, 3, 17);
INSERT INTO public.games VALUES (32, 4, 8);
INSERT INTO public.games VALUES (33, 2, 8);
INSERT INTO public.games VALUES (34, 1, 8);
INSERT INTO public.games VALUES (35, 5, 8);
INSERT INTO public.games VALUES (36, 3, 18);
INSERT INTO public.games VALUES (37, 4, 18);
INSERT INTO public.games VALUES (38, 5, 19);
INSERT INTO public.games VALUES (39, 5, 19);
INSERT INTO public.games VALUES (40, 5, 18);
INSERT INTO public.games VALUES (41, 2, 18);
INSERT INTO public.games VALUES (42, 3, 18);
INSERT INTO public.games VALUES (43, 861, 20);
INSERT INTO public.games VALUES (44, 696, 20);
INSERT INTO public.games VALUES (45, 5, 21);
INSERT INTO public.games VALUES (46, 513, 21);
INSERT INTO public.games VALUES (47, 28, 20);
INSERT INTO public.games VALUES (48, 777, 20);
INSERT INTO public.games VALUES (49, 482, 20);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, '');
INSERT INTO public.users VALUES (8, 'aa');
INSERT INTO public.users VALUES (9, 'user_1712185627074');
INSERT INTO public.users VALUES (10, 'user_1712185627073');
INSERT INTO public.users VALUES (11, 'user_1712185776449');
INSERT INTO public.users VALUES (12, 'user_1712185776448');
INSERT INTO public.users VALUES (13, 'user_1712185844566');
INSERT INTO public.users VALUES (14, 'user_1712185844565');
INSERT INTO public.users VALUES (15, 'user_1712185937844');
INSERT INTO public.users VALUES (16, 'user_1712185937843');
INSERT INTO public.users VALUES (17, 'ee');
INSERT INTO public.users VALUES (18, 'user_1712186242392');
INSERT INTO public.users VALUES (19, 'user_1712186242391');
INSERT INTO public.users VALUES (20, 'user_1712186297530');
INSERT INTO public.users VALUES (21, 'user_1712186297529');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 49, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 21, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key UNIQUE (name);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

