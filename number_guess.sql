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
-- Name: player_stats; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.player_stats ( username character varying(22) NOT NULL,
                                                                  player_id integer NOT NULL,
                                                                                    games_played integer, best_game integer);


ALTER TABLE public.player_stats OWNER TO freecodecamp;

--
-- Name: player_stats_player_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.player_stats_player_id_seq AS integer
START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;


ALTER TABLE public.player_stats_player_id_seq OWNER TO freecodecamp;

--
-- Name: player_stats_player_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.player_stats_player_id_seq OWNED BY public.player_stats.player_id;

--
-- Name: player_stats player_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.player_stats
ALTER COLUMN player_id
SET DEFAULT nextval('public.player_stats_player_id_seq'::regclass);

--
-- Data for Name: player_stats; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.player_stats
VALUES ('Fishy',
        1,
        1,
        45);

--
-- Name: player_stats_player_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.player_stats_player_id_seq', 1, true);

--
-- Name: player_stats player_stats_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.player_stats ADD CONSTRAINT player_stats_pkey PRIMARY KEY (player_id);

--
-- Name: player_stats player_stats_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.player_stats ADD CONSTRAINT player_stats_username_key UNIQUE (username);

--
-- PostgreSQL database dump complete
--
