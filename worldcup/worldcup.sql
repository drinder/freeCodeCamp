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

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

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
    year integer NOT NULL,
    round character varying(30) NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL
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
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying(30) NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (33, 2018, 'Final', 259, 260, 4, 2);
INSERT INTO public.games VALUES (34, 2018, 'Third Place', 261, 262, 2, 0);
INSERT INTO public.games VALUES (35, 2018, 'Semi-Final', 260, 262, 2, 1);
INSERT INTO public.games VALUES (36, 2018, 'Semi-Final', 259, 261, 1, 0);
INSERT INTO public.games VALUES (37, 2018, 'Quarter-Final', 260, 268, 3, 2);
INSERT INTO public.games VALUES (38, 2018, 'Quarter-Final', 262, 270, 2, 0);
INSERT INTO public.games VALUES (39, 2018, 'Quarter-Final', 261, 272, 2, 1);
INSERT INTO public.games VALUES (40, 2018, 'Quarter-Final', 259, 274, 2, 0);
INSERT INTO public.games VALUES (41, 2018, 'Eighth-Final', 262, 276, 2, 1);
INSERT INTO public.games VALUES (42, 2018, 'Eighth-Final', 270, 278, 1, 0);
INSERT INTO public.games VALUES (43, 2018, 'Eighth-Final', 261, 280, 3, 2);
INSERT INTO public.games VALUES (44, 2018, 'Eighth-Final', 272, 282, 2, 0);
INSERT INTO public.games VALUES (45, 2018, 'Eighth-Final', 260, 284, 2, 1);
INSERT INTO public.games VALUES (46, 2018, 'Eighth-Final', 268, 286, 2, 1);
INSERT INTO public.games VALUES (47, 2018, 'Eighth-Final', 274, 288, 2, 1);
INSERT INTO public.games VALUES (48, 2018, 'Eighth-Final', 259, 290, 4, 3);
INSERT INTO public.games VALUES (49, 2014, 'Final', 291, 290, 1, 0);
INSERT INTO public.games VALUES (50, 2014, 'Third Place', 293, 272, 3, 0);
INSERT INTO public.games VALUES (51, 2014, 'Semi-Final', 290, 293, 1, 0);
INSERT INTO public.games VALUES (52, 2014, 'Semi-Final', 291, 272, 7, 1);
INSERT INTO public.games VALUES (53, 2014, 'Quarter-Final', 293, 300, 1, 0);
INSERT INTO public.games VALUES (54, 2014, 'Quarter-Final', 290, 261, 1, 0);
INSERT INTO public.games VALUES (55, 2014, 'Quarter-Final', 272, 276, 2, 1);
INSERT INTO public.games VALUES (56, 2014, 'Quarter-Final', 291, 259, 1, 0);
INSERT INTO public.games VALUES (57, 2014, 'Eighth-Final', 272, 308, 2, 1);
INSERT INTO public.games VALUES (58, 2014, 'Eighth-Final', 276, 274, 2, 0);
INSERT INTO public.games VALUES (59, 2014, 'Eighth-Final', 259, 312, 2, 0);
INSERT INTO public.games VALUES (60, 2014, 'Eighth-Final', 291, 314, 2, 1);
INSERT INTO public.games VALUES (61, 2014, 'Eighth-Final', 293, 282, 2, 1);
INSERT INTO public.games VALUES (62, 2014, 'Eighth-Final', 300, 318, 2, 1);
INSERT INTO public.games VALUES (63, 2014, 'Eighth-Final', 290, 278, 1, 0);
INSERT INTO public.games VALUES (64, 2014, 'Eighth-Final', 261, 322, 2, 1);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (259, 'France');
INSERT INTO public.teams VALUES (260, 'Croatia');
INSERT INTO public.teams VALUES (261, 'Belgium');
INSERT INTO public.teams VALUES (262, 'England');
INSERT INTO public.teams VALUES (268, 'Russia');
INSERT INTO public.teams VALUES (270, 'Sweden');
INSERT INTO public.teams VALUES (272, 'Brazil');
INSERT INTO public.teams VALUES (274, 'Uruguay');
INSERT INTO public.teams VALUES (276, 'Colombia');
INSERT INTO public.teams VALUES (278, 'Switzerland');
INSERT INTO public.teams VALUES (280, 'Japan');
INSERT INTO public.teams VALUES (282, 'Mexico');
INSERT INTO public.teams VALUES (284, 'Denmark');
INSERT INTO public.teams VALUES (286, 'Spain');
INSERT INTO public.teams VALUES (288, 'Portugal');
INSERT INTO public.teams VALUES (290, 'Argentina');
INSERT INTO public.teams VALUES (291, 'Germany');
INSERT INTO public.teams VALUES (293, 'Netherlands');
INSERT INTO public.teams VALUES (300, 'Costa Rica');
INSERT INTO public.teams VALUES (308, 'Chile');
INSERT INTO public.teams VALUES (312, 'Nigeria');
INSERT INTO public.teams VALUES (314, 'Algeria');
INSERT INTO public.teams VALUES (318, 'Greece');
INSERT INTO public.teams VALUES (322, 'United States');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 64, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 322, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games games_opponent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_opponent_id_fkey FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games games_winner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_winner_id_fkey FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--


