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
    guesses integer NOT NULL,
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
    username character varying(22) NOT NULL
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

INSERT INTO public.games VALUES (1, 13, 2);
INSERT INTO public.games VALUES (2, 10, 2);
INSERT INTO public.games VALUES (3, 12, 2);
INSERT INTO public.games VALUES (4, 409, 3);
INSERT INTO public.games VALUES (5, 156, 3);
INSERT INTO public.games VALUES (6, 830, 4);
INSERT INTO public.games VALUES (7, 267, 4);
INSERT INTO public.games VALUES (8, 59, 3);
INSERT INTO public.games VALUES (9, 674, 3);
INSERT INTO public.games VALUES (10, 577, 3);
INSERT INTO public.games VALUES (11, 417, 5);
INSERT INTO public.games VALUES (12, 94, 5);
INSERT INTO public.games VALUES (13, 382, 6);
INSERT INTO public.games VALUES (14, 758, 6);
INSERT INTO public.games VALUES (15, 245, 5);
INSERT INTO public.games VALUES (16, 12, 5);
INSERT INTO public.games VALUES (17, 151, 5);
INSERT INTO public.games VALUES (18, 11, 2);
INSERT INTO public.games VALUES (19, 483, 7);
INSERT INTO public.games VALUES (20, 421, 7);
INSERT INTO public.games VALUES (21, 787, 8);
INSERT INTO public.games VALUES (22, 60, 8);
INSERT INTO public.games VALUES (23, 546, 7);
INSERT INTO public.games VALUES (24, 315, 7);
INSERT INTO public.games VALUES (25, 39, 7);
INSERT INTO public.games VALUES (26, 165, 9);
INSERT INTO public.games VALUES (27, 514, 9);
INSERT INTO public.games VALUES (28, 275, 10);
INSERT INTO public.games VALUES (29, 25, 10);
INSERT INTO public.games VALUES (30, 118, 9);
INSERT INTO public.games VALUES (31, 504, 9);
INSERT INTO public.games VALUES (32, 598, 9);
INSERT INTO public.games VALUES (33, 160, 12);
INSERT INTO public.games VALUES (34, 482, 12);
INSERT INTO public.games VALUES (35, 925, 13);
INSERT INTO public.games VALUES (36, 144, 13);
INSERT INTO public.games VALUES (37, 424, 12);
INSERT INTO public.games VALUES (38, 777, 12);
INSERT INTO public.games VALUES (39, 899, 12);
INSERT INTO public.games VALUES (40, 847, 14);
INSERT INTO public.games VALUES (41, 155, 14);
INSERT INTO public.games VALUES (42, 888, 15);
INSERT INTO public.games VALUES (43, 18, 15);
INSERT INTO public.games VALUES (44, 363, 14);
INSERT INTO public.games VALUES (45, 219, 14);
INSERT INTO public.games VALUES (46, 321, 14);
INSERT INTO public.games VALUES (47, 521, 16);
INSERT INTO public.games VALUES (48, 725, 16);
INSERT INTO public.games VALUES (49, 108, 17);
INSERT INTO public.games VALUES (50, 991, 17);
INSERT INTO public.games VALUES (51, 281, 16);
INSERT INTO public.games VALUES (52, 633, 16);
INSERT INTO public.games VALUES (53, 659, 16);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'wen');
INSERT INTO public.users VALUES (2, 'Jing');
INSERT INTO public.users VALUES (3, 'user_1721579630401');
INSERT INTO public.users VALUES (4, 'user_1721579630400');
INSERT INTO public.users VALUES (5, 'user_1721579715055');
INSERT INTO public.users VALUES (6, 'user_1721579715054');
INSERT INTO public.users VALUES (7, 'user_1721579909857');
INSERT INTO public.users VALUES (8, 'user_1721579909856');
INSERT INTO public.users VALUES (9, 'user_1721579972946');
INSERT INTO public.users VALUES (10, 'user_1721579972945');
INSERT INTO public.users VALUES (11, 'gitpod');
INSERT INTO public.users VALUES (12, 'user_1721580234588');
INSERT INTO public.users VALUES (13, 'user_1721580234587');
INSERT INTO public.users VALUES (14, 'user_1721580287228');
INSERT INTO public.users VALUES (15, 'user_1721580287227');
INSERT INTO public.users VALUES (16, 'user_1721580348900');
INSERT INTO public.users VALUES (17, 'user_1721580348899');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 53, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 17, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: games fk_games_users; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT fk_games_users FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

